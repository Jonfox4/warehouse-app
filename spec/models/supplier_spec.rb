require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when corporate name is empty' do
      #Arrange
      supplier = Supplier.new(corporate_name: '', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: 'Av. do Marketing',
                              city: 'São Bernardo', state: 'São Paulo', email: 'Exponencial@contato.com.br')
      #Act
      result = supplier.valid?
      #Assert
      expect(result).to eq false
      end
    end

    it 'false when city is empty' do
      #Arrange
      supplier = Supplier.new(corporate_name: 'Exponencial Marketing', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: 'Av. do Marketing',
                              city: '', state: 'São Paulo', email: 'Exponencial@contato.com.br')
      #Act
      result = supplier.valid?
      #Assert
      expect(result).to eq false
    end

    it 'false when address is empty' do
      #Arrange
      supplier = Supplier.new(corporate_name: 'Exponencial Marketing', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: '',
                              city: 'São Bernardo', state: 'São Paulo', email: 'Exponencial@contato.com.br')
      #Act
      result = supplier.valid?
      #Assert
      expect(result).to eq false
    end

    it 'false when name is already in use' do
      #Arrange
      first_Supplier = Supplier.new(corporate_name: 'Exponencial Marketing', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: '',
                                    city: 'São Bernardo', state: 'São Paulo', email: 'Exponencial@contato.com.br')
      second_supplier = Supplier.new(corporate_name: 'Exponencial Marketing', brand_name: 'Exponencial Marketing', registration_number: '00000000000000', full_address: '',
                                    city: 'São Bernardo', state: 'São Paulo', email: 'Exponencial@contato.com.br')
      #Act
      result = second_supplier.valid?
      #Assert
      expect(result).to eq false
    end
  end
end
