require 'rails_helper'

feature 'User search customer' do
  scenario 'by exact name' do
    user = User.create!(email: 'test@test.com', password: '12345678')
    customer = Customer.create!(name: 'Mario Godinho', 
                                document: '383.510.980-43', 
                                email: 'mario@mario.com.br')

    another_customer = Customer.create!(name: 'Julio Godinho', 
                                        document: '468.244.000-41', 
                                        email: 'julio@mario.com.br')

    login_as user, scope: :user
    visit root_path
    click_on 'Cliente'
    fill_in 'Busca', with: customer.name
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)

  end

end