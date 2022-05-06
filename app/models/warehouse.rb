class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :cep, :description, presence: true
  validates :code, uniqueness: true #length: {is: 3}
end
