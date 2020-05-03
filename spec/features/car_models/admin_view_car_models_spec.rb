require 'rails_helper'

feature 'Admin view car models' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    ford = Manufacturer.create!(name: 'Ford')
    car_category = CarCategory.create!(name: 'Econômico', daily_rate: 66, 
                                       car_insurance: 31, third_part_insurance: 22)

    CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, car_category: car_category)
    CarModel.create!(name: 'Ka', year: 2021, manufacturer: ford, car_category: car_category)

    visit root_path
    click_on 'Modelos de Carros'
    
    expect(page).to have_content 'Fiat'
    expect(page).to have_content 'Uno'
    expect(page).to have_content '2020'

    expect(page).to have_content 'Ford'
    expect(page).to have_content 'Ka'
    expect(page).to have_content '2021'
  end

  scenario 'end view details' do
    fiat = Manufacturer.create!(name: 'Fiat')
    car_category_a = CarCategory.create!(name: 'Econômico', daily_rate: 66, 
                                         car_insurance: 31,
                                         third_part_insurance: 22)

    car_category_b = CarCategory.create!(name: 'Especial', daily_rate: 250, 
                                         car_insurance: 100,
                                         third_part_insurance: 100)

    cm = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
                          motorization: '1.0', fuel_type: 'Flex', 
                          car_category: car_category_a)

    CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat,
                     motorization: '2.0 Turbo', fuel_type: 'Diesel', 
                     car_category: car_category_b)
                      
    visit root_path
    click_on 'Modelos de Carros'
    within("tr#car-model-#{cm.id}") do
      click_on 'Ver Detalhes'
    end

    expect(page).to have_content 'Uno'
    expect(page).to have_content 'Fiat'
    expect(page).to have_content '2020'
    expect(page).to have_content '1.0'
    expect(page).to have_content 'Flex'
    expect(page).to have_content 'Econômico'
    expect(page).to have_content 'R$ 66,00'

    expect(page).not_to have_content 'Toro'
    expect(page).not_to have_content 'Especial'
    expect(page).not_to have_content 'Diesel'
    expect(page).not_to have_content 'R$ 250,00'
  end
end