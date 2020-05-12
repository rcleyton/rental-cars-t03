require 'rails_helper'

feature 'Admin edit car category' do
    scenario 'all fields are complete' do
      car_category = CarCategory.create!(name: 'Econômico A',
                                        daily_rate: 65,
                                        car_insurance: 35,
                                        third_part_insurance: 30)

      user = User.create!(email: 'test@test.com', password: '123456789')

      login_as user, scope: :user
      visit root_path
      click_on 'Categorias de Carros'
      click_on 'Econômico'
      click_on 'Editar'
      fill_in 'Nome', with: 'Econômico A'
      fill_in 'Diária', with: '65'
      fill_in 'Seguro', with: '35'
      fill_in 'Seguro de terceiros', with: '30'
      click_on 'Enviar'

      expect(page).to have_content('Econômico A')
      expect(page).to have_content('R$ 65,00')
      expect(page).to have_content('R$ 35,00')
      expect(page).to have_content('R$ 30,00')
    end

end