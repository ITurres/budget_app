require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Category' do
        expect do
          post :create, params: { category: attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post :create, params: { category: attributes_for(:category) }

        expect(response).to redirect_to(category_url(Category.last))
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { category: attributes_for(:category, name: nil) }

        expect(response).to be_successful
      end
    end
  end

  describe 'GET #update' do
    context 'with valid params' do
      it 'updates the requested category' do
        patch :update, params: { id: category.id, category: { name: 'New name' } }

        category.reload

        expect(category.name).to eq('New name')
      end

      it 'redirects to the category' do
        patch :update, params: { id: category.id, category: { name: 'New name' } }

        expect(response).to redirect_to(category_url(category))
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        patch :update, params: { id: category.id, category: { name: nil } }

        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested category' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(0)
    end

    it 'redirects to the categories list' do
      delete :destroy, params: { id: category.id }

      expect(response).to redirect_to(categories_url)
    end
  end
end
