  class CarCategory < ApplicationRecord
  has_many :car_models
  has_many :cars, through: :car_models
  
  validates :name, presence: true
  validates :daily_rate, presence: true
  validates :car_insurance, presence: true
  validates :third_part_insurance, presence: true
                                        
end
