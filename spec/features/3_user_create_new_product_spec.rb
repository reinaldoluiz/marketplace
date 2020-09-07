require 'rails_helper'

feature 'User create new product' do 
  scenario 'must be signed in' do 
    #Arrange
    #Act
    visit root_path
    click_on 'Produtos'
    #Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Para continuar, faça login ou registre-se'
  end
  
  scenario 'sucessfully' do 
    #Arrange
    user = User.create!(name:'Silvio Santos', email:'silvio@sbt.com', password:'12345678')
    product = Product.create!(name: 'Carro', price: 150.000, description: 'O carro da sua vida, não encontrará nada melhor!', user: user)
    #Act
    login_as(user, scope: :user)
    visit root_path
    click_on 'Produtos'
    click_on 'Criar novo produto'

    fill_in 'Produto', with: 'Carro'
    fill_in 'Preço', with: 'R$ 150.000,00'
    fill_in 'Descrição', with: 'O carro da sua vida, não encontrará nada melhor!'

    #Assert
    expect(current_path).to eq product_path(Product.last)
    expect(page).to have_content('Carro')
    expect(page).to have_content('R$ 150.000,00')
    expect(page).to have_content('O carro da sua vida, não encontrará nada melhor!')
    expect(page).to have_content('Silvio Santos')
    expect(page).to have_link('Voltar')
  end
end