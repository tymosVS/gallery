require 'rails_helper'

describe HomePagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('home_pages#index')
    end
  end
end
