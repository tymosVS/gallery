require 'rails_helper'

describe PostsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories/1').to route_to('posts#index', category_id: '1',)
    end

    it 'routes to #create' do
      expect(post: '/categories/1').to route_to('posts#create', category_id: '1',)
    end

    it 'routes to #new' do
      expect(get: '/categories/1/new').to route_to('posts#new', category_id: '1',)
    end

    it 'routes to #show' do
      expect(get: '/categories/1/1').to route_to('posts#show', category_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/categories/1/1').to route_to('posts#update', category_id: '1', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/categories/1/1').to route_to('posts#update', category_id: '1', id: '1')
    end

    it 'routes to #delete' do
      expect(delete: '/categories/1/1').to route_to('posts#destroy', category_id: '1', id: '1')
    end
  end
end