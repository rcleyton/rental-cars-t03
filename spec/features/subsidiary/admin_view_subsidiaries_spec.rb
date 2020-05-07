require 'rails_helper'

feature 'admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Filial Minas Gerais', cnpj: '16.606.164/0001-05',
                       adress: 'Avenida do Contorno, 7777')
    Subsidiary.create!(name: 'Filial São Paulo', cnpj: '26.412.137/0001-47',
                       adress: 'Rua Manoel Garrido Ferri, 546')

    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Filial Minas Gerais')
    expect(page).to have_content('Filial São Paulo')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Filial Minas Gerais', cnpj: '16.606.164/0001-05',
                       adress: 'Avenida do Contorno, 7777')
    Subsidiary.create!(name: 'Filial São Paulo', cnpj: '26.412.137/0001-47',
                      adress: 'Rua Manoel Garrido Ferri, 546')

    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Filial Minas Gerais'

    expect(page).to have_content('Minas Gerais')
    expect(page).not_to have_content('São Paulo')
  end
  
  scenario 'and no subsidiaries are created' do
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    
    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Filial Minas Gerais', cnpj: '16.606.164/0001-05',
                       adress: 'Avenida do Contorno, 7777')
    Subsidiary.create!(name: 'Filial São Paulo', cnpj: '26.412.137/0001-47',
                       adress: 'Rua Manoel Garrido Ferri, 546')

    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end  

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Filial Minas Gerais', cnpj: '16.606.164/0001-05',
                       adress: 'Avenida do Contorno, 7777')
    Subsidiary.create!(name: 'Filial São Paulo', cnpj: '26.412.137/0001-47',
                       adress: 'Rua Manoel Garrido Ferri, 546')

    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Filial Minas Gerais'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
  
end