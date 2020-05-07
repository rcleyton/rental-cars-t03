require 'rails_helper'

feature 'Admin register valid manufacturer' do
  scenario 'and name must be unique' do
    Manufacturer.create!(name: 'Fiat' )
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end

  scenario 'and name can not be blank' do
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

end

