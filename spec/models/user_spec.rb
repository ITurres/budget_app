require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it 'requires a name' do
      expect(user).to be_valid
    end

    context 'when name is provided' do
      it 'should be valid' do
        expect(user).to be_valid
      end
    end

    context 'when name is nil' do
      it 'should not be valid' do
        user.name = nil
        expect(user).to_not be_valid
      end
    end
  end
end
