require 'rails_helper'

describe ProfileController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/profile').to route_to('profile#index')
    end
  end
end
