require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir do menu' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    #Assert
    expect(current_path).to eq suppliers_path
  end

  it 'com sucesso' do
    #Arrange
    Supplier.create!(corporate_name:'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                    full_address:'Av. ACME, 1000', city: 'Bauru', state: 'SP', email:'contato@acme.com.br')
    Supplier.create!(corporate_name:'Stark Industries', brand_name: 'Stark', registration_number: '53447216000102',
                    full_address:'Torre da Industria', city: 'Teresina', state: 'PI', email:'vendas@starks.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    #Assert
    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('ACME')
    expect(page).to have_content('Bauru - SP')
    expect(page).to have_content('Stark')
    expect(page).to have_content('Teresina - PI')
  end

  it 'e não existem fornecedores cadastrados' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    #Assert
    expect(page).to have_content 'Não existem fornecedores cadastrados'
  end
end
