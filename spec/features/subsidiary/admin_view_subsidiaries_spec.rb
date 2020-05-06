require 'rails_helper'

feature 'admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Filial Paraná', cnpj: '16.606.164/0001-05')
    Subsidiary.create!(name: 'Filial Espírito Santo', cnpj: '26.412.137/0001-47')
    
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Filial Paraná')
    expect(page).to have_content('Filial Espírito Santo')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Filial Paraná', cnpj: '16.606.164/0001-05')
    Subsidiary.create!(name: 'Filial Espírito Santo', cnpj: '26.412.137/0001-47')

    visit root_path
    click_on 'Filiais'
    click_on 'Filial Paraná'

    expect(page).to have_content('Filial Paraná')
    expect(page).not_to have_content('Filial Espírito Santo')
  end
  
  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Filial Paraná', cnpj: '16.606.164/0001-05')
    Subsidiary.create!(name: 'Filial Espírito Santo', cnpj: '26.412.137/0001-47')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end  

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Filial Paraná', cnpj: '16.606.164/0001-05')
    Subsidiary.create!(name: 'Filial Espírito Santo', cnpj: '26.412.137/0001-47')

    visit root_path
    click_on 'Filiais'
    click_on 'Filial Paraná'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
  
end