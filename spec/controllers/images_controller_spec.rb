# frozen_string_literal: true

require 'rails_helper'

describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/images').to route_to('images#index')
    end

    it 'routes to #show' do
      expect(get: '/images/1').to route_to('images#show', id: '1')
    end
  end
end

describe ImagesController,  type: :controller do

  context 'GET #index' do 
    it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
    end
  end

  context 'GET #show' do 
    let(:image) { create(:image) }
    it 'should success and render to show page' do
        get :show, params: { id: image.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
    end
  end
end
