class Subsidiary < ApplicationRecord
  validates :name, :cnpj, presence: true
  validates :name, uniqueness: true
  validates :cnpj, format: { with: (/\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}/), message: 'não é válido'}
  validate :cnpj_must_be_valid

  private
  def cnpj_must_be_valid
    return if CNPJ.valid?(cnpj)
    errors.add(:cnpj, :invalid)
  end
end
