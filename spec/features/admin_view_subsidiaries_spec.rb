require 'rails_helper'

feature 'admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Minas Gerais')
    Subsidiary.create!(name: 'São Paulo')
    
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Minas Gerais')
    expect(page).to have_content('São Paulo')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Minas Gerais', 
                       cnpj: '07.694.743/0001-58',
                       adress: 'Avenida do Contorno, 7777')

    visit root_path
    click_on 'Filiais'
    click_on 'Minas Gerais'

    expect(page).to have_css('h1', text: 'Minas Gerais')
    expect(page).to have_css('li', text: '07.694.743/0001-58')
    expect(page).to have_css('li', text: 'Avenida do Contorno, 777')
  end
  
  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Filial Paraná')
    Subsidiary.create!(name: 'Filial Espírito Santo')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end  

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Filial Paraná')
    Subsidiary.create!(name: 'Filial Espírito Santo')

    visit root_path
    click_on 'Filiais'
    click_on 'Filial Paraná'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
  
end