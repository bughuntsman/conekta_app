require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:price]).to include("can't be blank")
    end

    it 'is not valid with a negative price' do
      subject.price = -1
      expect(subject).not_to be_valid
      expect(subject.errors[:price]).to include("must be greater than or equal to 0")
    end

    it 'is not valid with a non-numeric price' do
      subject.price = 'abc'
      expect(subject).not_to be_valid
      expect(subject.errors[:price]).to include("is not a number")
    end
  end

  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:product)).to be_valid
    end
  end
end
