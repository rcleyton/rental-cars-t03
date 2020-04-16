require 'rails_helper'

  feature 'User register customer' do
    scenario 'from index page' do
      visit root_path
      click_on 'Clientes'

      expect(page).to have_link('Registrar cliente', href: new_customer_path)
    end

    scenario 'successfuly' do
      visit root_path
      click_on 'Clientes'
      click_on 'Registrar cliente'

      fill_in 'Nome', with: 'Ronaldo Nazário'
      fill_in 'CPF', with: '489.521.302-15'
      fill_in 'E-mail', with: 'ronaldo@r9.com'
      click_on 'Enviar'

      expect(current_path).to eq customer_path(Customer.last.id)
      expect(page).to have_css('h1', text: 'Ronaldo Nazário')
      expect(page).to have_css('li', text: '489.521.302-15')
      expect(page).to have_css('li', text: 'ronaldo@r9.com')
    end  
  end
