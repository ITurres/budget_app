require 'rails_helper'

RSpec.describe TransactionDetailsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/transaction_details').to route_to('transaction_details#index')
    end

    it 'routes to #new' do
      expect(get: '/transaction_details/new').to route_to('transaction_details#new')
    end

    it 'routes to #show' do
      expect(get: '/transaction_details/1').to route_to('transaction_details#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/transaction_details/1/edit').to route_to('transaction_details#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/transaction_details').to route_to('transaction_details#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/transaction_details/1').to route_to('transaction_details#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/transaction_details/1').to route_to('transaction_details#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/transaction_details/1').to route_to('transaction_details#destroy', id: '1')
    end
  end
end
