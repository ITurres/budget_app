require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:subject) { create(:category, user:) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  describe '#total_amount_spent' do
    it 'returns the total amount spent for transactions in the category' do
      subject.transaction_details.create(name: 'Transaction 1', amount: 50, user:)
      subject.transaction_details.create(name: 'Transaction 2', amount: 75, user:)

      expect(subject.total_amount_spent).to eq(125)
    end
  end
end
