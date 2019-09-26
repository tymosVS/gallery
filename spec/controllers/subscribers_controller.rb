require 'rails_helper'

describe SubscribersController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/categories/1/subscribers').to route_to('subscribers#create', category_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/categories/1/subscribers/new').to route_to('subscribers#new', category_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/categories/1/subscribers/1').to route_to('subscribers#destroy', category_id: '1', id: '1')
    end
  end
end
