# spec/models/order_spec.rb
require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { build(:order) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a status' do
      subject.status = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:status]).to include("can't be blank")
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:amount]).to include("can't be blank")
    end

    it 'is not valid with a negative amount' do
      subject.amount = -1
      expect(subject).not_to be_valid
      expect(subject.errors[:amount]).to include("must be greater than or equal to 0")
    end

    it 'is not valid with a non-numeric amount' do
      subject.amount = 'abc'
      expect(subject).not_to be_valid
      expect(subject.errors[:amount]).to include("is not a number")
    end

    it 'is not valid without a checkout_id' do
      subject.checkout_id = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:checkout_id]).to include("can't be blank")
    end

    it 'is not valid without a payment_link' do
      subject.payment_link = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:payment_link]).to include("can't be blank")
    end
  end

  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:order)).to be_valid
    end
  end
end
