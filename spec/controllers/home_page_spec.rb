# frozen_string_literal: true

require 'rails_helper'

describe HomePagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('home_pages#index')
    end
  end
end

describe HomePagesController,  type: :controller do
  context 'GET #index' do 
    it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
    end
  end
end