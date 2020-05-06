require 'rails_helper'

feature 'Admin register rental' do
  scenario 'successfully' do
    customer = Customer.create!(name: 'Mario Godinho', document: '383.510.980-43', 
                                email: 'mario@mario.com.br')

    car_category = CarCategory.create!(name: 'Econômico', daily_rate: 60,
                                       car_insurance: 30, 
                                       third_part_insurance: 20)

    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    click_on 'Registrar nova locação'
    fill_in 'Data de início', with: '27/07/2030'
    fill_in 'Data de término', with: '29/07/2030'
    select customer.name, from: 'Cliente'
    select car_category.name, from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('Data de início: 27/07/2030')
    expect(page).to have_content('Data de término: 29/07/2030')
    expect(page).to have_content("Cliente: #{customer.name}")
    expect(page).to have_content("Categoria: #{car_category.name}")
  end

  xscenario 'and must fill in all blank' do
  end

  scenario 'and must be authenticated' do
    visit new_rental_path
    expect(current_path).to eq(new_user_session_path)

  end
end