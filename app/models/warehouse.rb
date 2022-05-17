class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :cep, :description, presence: true
  validates :code, uniqueness: true
  validates :code, length: {is: 3}
  validates :cep, format: {with: /\A\d{5}-\d{3}\Z/, message: 'No formato xxxxx-xxx' }
end
