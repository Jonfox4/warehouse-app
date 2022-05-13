require 'rails_helper'

describe 'Usuário vê detalhes do fornecedor' do
  it 'a partir da tela inicial' do
    #Arrange
    Supplier.create!(corporate_name:'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address:'Av. ACME, 1000', city: 'Bauru', state: 'SP', email:'contato@acme.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    #Assert
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('Documento: 43447216000102')
    expect(page).to have_content('Av. ACME, 1000')
    expect(page).to have_content('contato@acme.com.br')
  end

  it 'e volta para a tela inicial' do
    #Arrange
    Supplier.create!(corporate_name:'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                    full_address:'Av. ACME, 1000', city: 'Bauru', state: 'SP', email:'contato@acme.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
