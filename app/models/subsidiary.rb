class Subsidiary < ApplicationRecord
  validates :name, :cnpj, presence: { message: 'não pode ficar em branco' }
  validates :name, uniqueness: { message: 'já está em uso' }
end
