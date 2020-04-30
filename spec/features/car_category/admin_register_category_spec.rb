require 'rails_helper'
#revisar
feature 'Admin register category' do
  scenario 'from index page' do
    visit root_path
    click_on 'Categoria de Carros'

    expect(page).to have_link('Registrar nova categoria', href: new_car_category_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Categoria de Carros'
    click_on 'Registrar nova categoria'
     
    fill_in 'Nome', with: 'Intermediário'
    fill_in 'Diária', with: 70
    fill_in 'Seguro', with: 35
    fill_in 'Seguro de terceiros', with: 21
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('Intermediário')
    expect(page).to have_content(70)
    expect(page).to have_content(35)
    expect(page).to have_content(21)
    expect(page).to have_link('Voltar')
  end  
  
end