# frozen_string_literal: true

require 'rails_helper'

describe ImagesController, type: :routing do
  describe 'routing' do
    context 'have' do
      it 'routes to #index' do
        expect(get: '/images').to route_to('images#index')
      end

      it 'routes to #show' do
        expect(get: '/images/1').to route_to('images#show', id: '1')
      end

      it { should route(:get, '/images').to(action: :index) }
      it { should route(:get, '/images/1').to(action: :show, id: 1) }
    end

    context 'not have' do
      it { should_not route(:delete, '/images/1').to(action: :destroy, id: 1) }
      it { should_not route(:get, '/images/new').to(action: :new) }
      it { should_not route(:post, '/images').to(action: :create) }
      it { should_not route(:patch, '/images/1').to(action: :update, id: 1) }
      it { should_not route(:put, '/images/1').to(action: :update, id: 1) }
      it { should_not route(:get, '/images/1/edit').to(action: :edit, id: 1) }
    end
  end
end

describe ImagesController, type: :controller do
  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context 'actions' do
    %i[set_image].each do |action|
      it { should use_before_action(action) }
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
