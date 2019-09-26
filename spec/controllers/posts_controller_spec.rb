require 'rails_helper'

describe PostsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/categories/1/1').to route_to('posts#show', category_id: '1', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/categories/1/1').to route_to('posts#update', category_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/categories/1/1').to route_to('posts#update', category_id: '1', id: '1')
    end

    it 'routes to #delete' do
      expect(delete: '/categories/1/1').to route_to('posts#destroy', category_id: '1', id: '1')
    end
  end
end