require 'rails_helper'

feature 'User authentication' do
  scenario 'successfuly'do
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    expect(page).to have_content('Entrou com sucesso')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    expect(current_path).to eq(root_path)
  end
end