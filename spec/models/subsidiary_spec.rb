require 'rails_helper'

describe Subsidiary do
  context '#name' do
    it "name can't be blank" do
      subsidiary = Subsidiary.new(name: '')    
      subsidiary.valid?
      expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
    end

    it 'must be unique' do
      Subsidiary.create!(name: 'Paulista', cnpj: '75.541.502/0001-09')
      subsidiary = Subsidiary.new(name: 'Paulista')
      subsidiary.valid?
      expect(subsidiary.errors[:name]).to include('já está em uso')
    end
  end

  context '#cnpj' do
    it 'cnpj cannot be blank' do
      subsidiary = Subsidiary.new(cnpj: '')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('não pode ficar em branco')
    end

    it 'must be valid format' do
      subsidiary = Subsidiary.new(cnpj: '23.534.432/0010-00') 
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('não é válido')
    end

    it 'must be ponctuated' do
      subsidiary = Subsidiary.new(cnpj: '20749748000107') 
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('não é válido')
    end
  end
end
