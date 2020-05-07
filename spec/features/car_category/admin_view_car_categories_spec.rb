require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    # Arrange
    CarCategory.create!(name: 'A', daily_rate: 50)
    CarCategory.create!(name: 'B', daily_rate: 70)
    user = User.create!(email: 'test@test.com', password: '12345678')

    

    # Act
    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de Carros'

    # Assert
    expect(page).to have_content 'Categoria A'
    expect(page).to have_content 'R$ 50,00'
    
    expect(page).to have_content 'Categoria B'
    expect(page).to have_content 'R$ 70,00'
  end

  scenario 'view car category details' do
    # Arrange
    car_category = CarCategory.create!(name: 'A', daily_rate: 50, 
                                       car_insurance: 40, 
                                       third_part_insurance: 30)
    manufacturer = Manufacturer.create!(name: 'Fiat')
    uno = CarModel.create!(name: 'Uno', year: 2020, manufacturer: manufacturer, 
                           motorization: '1.0', fuel_type: 'Flex', 
                           car_category: car_category)
    mobi = CarModel.create!(name: 'Mobi', year: 2020, manufacturer: manufacturer, 
                            motorization: '1.0', fuel_type: 'Flex', 
                            car_category: car_category)

    user = User.create!(email: 'test@test.com', password: '12345678')
                            
    # Act
    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Categoria A'

    # Assert
    expect(page).to have_css('h1', text: 'Categoria A')
    expect(page).to have_content('Diária: R$ 50,00')
    expect(page).to have_content('Seguro do Carro: R$ 40,00')
    expect(page).to have_content('Seguro para Terceiros: R$ 30,00')
    expect(page).to have_link('Uno', href: car_model_path(uno))
    expect(page).to have_link('Mobi', href: car_model_path(mobi))
    expect(page).to have_link('Voltar', href: car_categories_path)
  end

  scenario 'empty list' do
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de Carros'

    expect(page).to have_content('Nenhuma categoria cadastrada')
  end

  scenario 'and view filtered car models' do
    # Arrange
    car_category_a = CarCategory.create!(name: 'A', daily_rate: 50, 
                                         car_insurance: 40, 
                                         third_part_insurance: 30)
    car_category_b = CarCategory.create!(name: 'B', daily_rate: 50, 
                                         car_insurance: 40, 
                                         third_part_insurance: 30)
    manufacturer = Manufacturer.create!(name: 'Fiat')
    uno = CarModel.create!(name: 'Uno', year: 2020, manufacturer: manufacturer, 
                           motorization: '1.0', fuel_type: 'Flex', 
                           car_category: car_category_a)
    argos = CarModel.create!(name: 'Argos', year: 2020, manufacturer: manufacturer, 
                             motorization: '1.0', fuel_type: 'Flex', 
                             car_category: car_category_b)

    user = User.create!(email: 'test@test.com', password: '12345678')
    
    # Act
    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Categoria A'

    # Assert
    expect(page).to have_link('Uno', href: car_model_path(uno))
    expect(page).not_to have_link('Argos')
  end
end