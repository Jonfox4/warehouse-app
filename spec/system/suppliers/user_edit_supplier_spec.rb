require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da páginas de detalhes' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Exponencial Marketing', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: 'Av. do Marketing',
                                 city: 'São Bernardo', state: 'São Paulo', email: 'Exponencial@contato.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Exponencial Marketing'
    click_on 'Editar'
    fill_in 'Razão Social', with: 'Exponencial Modificado'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Exponencial Modificado'
  end

  describe 'Usuário edita um fornecedor' do
    it 'com dados vazios' do
      #Arrange
      supplier = Supplier.create!(corporate_name: 'Exponencial Marketing', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: 'Av. do Marketing',
                                   city: 'São Bernardo', state: 'São Paulo', email: 'Exponencial@contato.com.br')
      #Act
      visit root_path
      click_on 'Fornecedores'
      click_on 'Exponencial Marketing'
      click_on 'Editar'
      fill_in 'Razão Social', with: ''
      click_on 'Enviar'

      #Assert
      expect(page).to have_content 'Razão Social não pode ficar em branco'
      expect(page).to have_content 'Não foi possível atualizar Fornecedor'
    end
  end
end
