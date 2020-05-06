require 'rails_helper'

RSpec.describe Rental, type: :model do
  it 'should generate a code on create' do
    customer = Customer.create!(name: 'Cleyton', 
                                email: 'cleyton@teste.com.br',
                                document: '476.042.680-99')

    car_category = CarCategory.create!(name: 'Econômico')
    rental = Rental.new(start_date: 1.day.from_now,
                        end_date: 2.days.from_now,
                        customer: customer, car_category: car_category)

    rental.save

    expect(rental.code).to_not be_blank 
  end
end
