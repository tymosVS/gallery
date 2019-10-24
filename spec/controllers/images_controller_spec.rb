# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe ImagesController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(get: '/images').to route_to('images#index') }
      it { expect(get: '/images/1').to route_to('images#show', id: '1') }
    end

    context 'not have' do
      it { expect(delete: '/images/1').to_not route_to(action: :destroy, id: 1) }
      it { expect(get: '/images/new').to_not route_to(action: :new) }
      it { expect(post: '/images').to_not route_to(action: :create) }
      it { expect(patch: '/images/1').to_not route_to(action: :update, id: 1) }
      it { expect(put: '/images/1').to_not route_to(action: :update, id: 1) }
      it { expect(get: '/images/1/edit').to_not route_to(action: :edit, id: 1) }
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
      it { expect use_before_action(action) }
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
