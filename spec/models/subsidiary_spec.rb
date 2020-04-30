require 'rails_helper'

RSpec.describe Subsidiary, type: :model do
  it "name can't be blank" do
    subsidiary = Subsidiary.new(name: '')    
    subsidiary.valid?
    expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
  end

  it 'name must be unique' do
    Subsidiary.create!(name: 'Paulista', cnpj: '75.541.502/0001-09')
    subsidiary = Subsidiary.new(name: 'Paulista')
    subsidiary.valid?
    expect(subsidiary.errors[:name]).to include('já está em uso')
  end

  it 'cnpj cannot be blank' do
    subsidiary = Subsidiary.new(cnpj: '')
    subsidiary.valid?
    expect(subsidiary.errors[:cnpj]).to include('não pode ficar em branco')
  end
end
