require 'rails_helper'

feature 'User create new product' do 
  xscenario 'must be signed in' do 
    #Arrange
    #before_action :authenticate_user!, only: [:index]
    #Act
    visit root_path
    click_on 'Categorias'
    #Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Para continuar, faça login ou registre-se'
  end
  
  xscenario 'sucessfully' do 
    #Arrange
    #Act
    #Assert
  end
end