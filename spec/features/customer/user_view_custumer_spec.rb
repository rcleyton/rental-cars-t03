require 'rails_helper'

  feature 'User view customer' do
    scenario 'successfuly' do
      Customer.create!(name: 'Ronaldo Nazário')
      Customer.create!(name: 'Edson Arantes')
      user = User.create!(email: 'test@test.com', password: '12345678')

      login_as user, scope: :user
      visit root_path
      click_on 'Clientes'

      expect(page).to have_content('Ronaldo Nazário')
      expect(page).to have_content('Edson Arantes')
    end

    scenario 'and view details' do
      Customer.create!(name: 'Ronaldo Nazário',
                       document: '489.521.302-15',
                       email: 'ronaldo@r9.com')

      user = User.create!(email: 'test@test.com', password: '12345678')
      
      login_as user, scope: :user
      visit root_path
      click_on 'Clientes'
      click_on 'Ronaldo Nazário'

      expect(page).to have_css('h1', text: 'Ronaldo Nazário')
      expect(page).to have_css('li', text: '489.521.302-15')
      expect(page).to have_css('li', text: 'ronaldo@r9.com')
    end
    
    scenario 'and no customer are created' do
      user = User.create!(email: 'test@test.com', password: '12345678')

      login_as user, scope: :user
      visit root_path 
      click_on 'Clientes'

      expect(page).to have_content('Nenhum cliente cadastrado')
    end

    scenario ' and return to home page' do
      Customer.create!(name: 'Ronaldo Nazário')
      Customer.create!(name: 'Edson Arantes')
      user = User.create!(email: 'test@test.com', password: '12345678')

      login_as user, scope: :user
      visit root_path
      click_on 'Clientes'
      click_on 'Voltar'

      expect(current_path).to eq root_path
    end

    scenario 'and return to customer page' do
      Customer.create!(name: 'Ronaldo Nazário')
      Customer.create!(name: 'Edson Arantes')
      user = User.create!(email: 'test@test.com', password: '12345678')

      login_as user, scope: :user
      visit root_path
      click_on 'Clientes'
      click_on 'Ronaldo Nazário'
      click_on 'Voltar'

      expect(current_path).to eq customers_path
    end
end