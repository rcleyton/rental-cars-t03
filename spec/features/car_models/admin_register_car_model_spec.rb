require 'rails_helper'

feature 'Admin register car models' do
  scenario 'successfuly' do
    manufacturer = Manufacturer.create!(name: 'Fiat')
    car_category = CarCategory.create!(name: 'Econômico', daily_rate: 70,
                                       car_insurance: 30, third_part_insurance: 30)

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Registrar modelo de carro'

    fill_in 'Nome', with: 'Uno'
    fill_in 'Ano', with: '2020'
    fill_in 'Motor', with: '1.0'
    fill_in 'Combustível', with: 'Flex'

    select 'Fiat', from: 'Fabricante'
    select 'Econômico', from: 'Categoria'

    click_on 'Enviar'

    expect(page).to have_content('Modelo de Carro Uno')
    expect(page).to have_content('Uno')
    expect(page).to have_content('2020')
    expect(page).to have_content('1.0')
    expect(page).to have_content('R$ 70,00')
    expect(page).to have_content('Econômico')
  end

  scenario 'and fill in all fields' do
    visit new_car_model_path
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Ano não pode ficar em branco')
  end
end