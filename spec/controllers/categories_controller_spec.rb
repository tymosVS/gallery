require 'rails_helper'

describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes to #delete' do
      expect(delete: '/categories/1').to route_to('categories#destroy', id: '1')
    end
  end
end
