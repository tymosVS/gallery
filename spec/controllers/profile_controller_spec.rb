require 'rails_helper'

describe ProfileController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/profile').to route_to('profile#index')
    end
  end
end

describe ProfileController,  type: :controller do
  context 'profile #index' do 
    let(:user) { create(:user) }

    it 'should success and render to index page' do
        sign_in user
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
    end

    it 'profile redirect to login if not active session' do
      get :index
      assert_response :redirect
    end
  end
end