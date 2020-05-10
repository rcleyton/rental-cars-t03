require 'rails_helper'

feature 'User view rental' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '12345678')

    customer = Customer.create!(name: 'Mario Godinho',
                                email: 'teste@teste.com',
                                document: '776.402.998-02')
    car_category = CarCategory.create!(name: 'Econômico')

    rental = Rental.create!(customer: customer,
                            car_category: car_category, 
                            start_date: '22/07/2019', 
                            end_date: '24/07/2019')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within 'form' do
      click_on 'Entrar'
    end
    click_on 'Locações'

    expect(page).to have_content(rental.code)
    expect(page).to have_content('22/07/2019')
    expect(page).to have_content('24/07/2019')
    expect(page).to have_content('Mario Godinho')
    expect(page).to have_content('Econômico')
 

  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Locações')
  end

  scenario 'cannot view unless logged in' do
    visit rentals_path

    expect(current_path).to eq(new_user_session_path)
  end
end