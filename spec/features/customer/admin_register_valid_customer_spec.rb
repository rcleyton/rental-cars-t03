require 'rails_helper'

feature 'Admin validates customer' do
  scenario "can't be blank" do
    user = User.create!(email: 'test@test.com', password: '12345678')
    customer = Customer.create!(name: 'Ronaldo Nazário',
                                email: 'ronaldo@r9.com',
                                document: '776.402.998-02')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar cliente'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario "and cnpj can't be blank" do
    user = User.create!(email: 'test@test.com', password: '12345678')
    customer = Customer.create!(name: 'Ronaldo Nazário',
                                email: 'ronaldo@r9.com',
                                document: '776.402.998-02')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar cliente'
    fill_in 'CPF', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario "and cnpj must be unique" do
    user = User.create!(email: 'test@test.com', password: '12345678')
    customer = Customer.create!(name: 'Ronaldo Nazário',
                                email: 'ronaldo@r9.com',
                                document: '776.402.998-02')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar cliente'
    fill_in 'CPF', with: '776.402.998-02'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end

  scenario "and email cannot be blank" do
    user = User.create!(email: 'test@test.com', password: '12345678')
    customer = Customer.create!(name: 'Ronaldo Nazário',
                                email: 'ronaldo@r9.com',
                                document: '776.402.998-02')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar cliente'
    fill_in 'E-mail', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario "and email must be unique" do
    user = User.create!(email: 'test@test.com', password: '12345678')
    customer = Customer.create!(name: 'Ronaldo Nazário',
                                email: 'ronaldo@r9.com',
                                document: '776.402.998-02')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar cliente'
    fill_in 'E-mail', with: 'ronaldo@r9.com'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
    
  
end