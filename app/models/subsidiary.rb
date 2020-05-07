class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :adress, presence: true
  validates :name, :cnpj, uniqueness: true
  validates :cnpj, format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/, message: 'com formato inválido' }
  validate :cnpj_must_be_valid

  private
  def cnpj_must_be_valid
    return if CNPJ.valid?(cnpj)
    errors.add(:cnpj, :invalid)
  end
end
