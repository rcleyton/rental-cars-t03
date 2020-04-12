require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Filial Belo Horizonte'
    fill_in 'CNPJ', with: '07.694.743/0001-58'
    fill_in 'Endereço', with: 'Avenida do Contorno, 7777 - Lourdes CEP 30110-051 - Belo Horizonte'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Filial Belo Horizonte')
    expect(page).to have_content('07.694.743/0001-58')
    expect(page).to have_content('Avenida do Contorno, 7777 - Lourdes CEP 30110-051 - Belo Horizonte')
    expect(page).to have_link('Voltar')
  end

end