class Manufacturer < ApplicationRecord
  validates :name, uniqueness: { message: 'Nome deve ser único' } # valida nome como único
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end


