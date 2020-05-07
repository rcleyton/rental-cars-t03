require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    Manufacturer.create(name: 'Fiat')
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('Honda')
  end

  scenario 'successfully' do
    Manufacturer.create(name: 'Fiat')
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'successfully' do
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Honda')
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
end
