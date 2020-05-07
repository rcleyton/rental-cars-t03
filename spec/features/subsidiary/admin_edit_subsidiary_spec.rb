require 'rails_helper'

feature 'Admin edit subsidiary' do
  scenario 'and name cannot be blank' do
    user = User.create!(email: 'test@test.com', password: '12345678')
    Subsidiary.create!(name: 'Minas Gerais',
                       cnpj: '07.694.743/0001-58',
                       adress: 'Avenida do Contorno, 7777')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Minas Gerais'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end
end