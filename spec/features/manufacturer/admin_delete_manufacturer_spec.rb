require 'rails_helper'

feature 'Admin delete manufacturer' do
  scenario 'successfully' do
    Manufacturer.create!(name: 'Fiat')
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Apagar'

    expect(current_path).to eq manufacturers_path
    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'and keep anothers' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Honda')
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Apagar'

    expect(current_path).to eq manufacturers_path
    expect(page).not_to have_content('Fiat')
    expect(page).to have_content('Honda')
  end
end
