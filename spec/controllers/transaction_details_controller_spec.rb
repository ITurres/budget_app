require 'rails_helper'

RSpec.describe TransactionDetailsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:transaction_detail) { create(:transaction_detail, user:) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new TransactionDetail' do
        expect do
          post :create, params: { transaction_detail: attributes_for(:transaction_detail) }
        end.to change(TransactionDetail, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested transaction_detail' do
      expect do
        delete :destroy, params: { id: transaction_detail.id }
      end.to change(TransactionDetail, :count).by(0)
    end
  end
end
