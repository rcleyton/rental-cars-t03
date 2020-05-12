class Customer < ApplicationRecord
  has_many :rentals
  validates :name, presence: true
  validates :email, presence: true
  validates :document, presence: true
  validates :document, :email, uniqueness: true
  validate :cpf_must_be_valid

  scope :search, ->(query) { where('name LIKE ?', "%#{query}%")
                                   .or(where(document: query)) }

  private
  def cpf_must_be_valid
    return if CPF.valid?(document)
    errors.add(:document, :invalid)
  end
end
