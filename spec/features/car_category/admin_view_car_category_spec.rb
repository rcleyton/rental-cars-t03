require 'rails_helper'

feature 'Admin view car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Econômico', daily_rate: 50)
    CarCategory.create!(name: 'Intermediário', daily_rate: 70)

    visit root_path
    click_on 'Categoria de Carros'

    expect(page).to have_content('Econômico')
    expect(page).to have_content('R$ 50,00')

    expect(page).to have_content('Intermediário')
    expect(page).to have_content('R$ 70,00')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'Econômico', daily_rate: 45.0, car_insurance: 28.5,
                        third_part_insurance: 18.5)

    visit root_path
    click_on 'Categoria de Carros'
    click_on 'Econômico'

    expect(page).to have_css('h1', text: 'Econômico')
    expect(page).to have_css('dd', text: 'R$ 45,00')
    expect(page).to have_css('dd', text: 'R$ 28,50')
    expect(page).to have_css('dd', text: 'R$ 18,50')
  end

  scenario 'and no car category are created' do
    visit root_path
    click_on 'Categoria de Carros'

    expect(page).to have_content('Nenhuma categoria cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'Econômico')
    CarCategory.create!(name: 'Intermediário')

    visit root_path
    click_on 'Categoria de Carros'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car category page' do
    CarCategory.create!(name: 'Econômico')
    CarCategory.create!(name: 'Intermediário')

    visit root_path
    click_on 'Categoria de Carros'
    click_on 'Econômico'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end