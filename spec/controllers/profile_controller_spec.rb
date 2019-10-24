# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe ProfileController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(get: '/profile').to route_to('profile#index') }
    end

    context 'not have' do
      it { expect(delete: '/profile/1').to_not route_to(action: :destroy, id: 1) }
      it { expect(get: '/profile/new').to_not route_to(action: :new) }
      it { expect(post: '/profile/').to_not route_to(action: :create) }
      it { expect(get: '/profile/1').to_not route_to(action: :show, id: 1) }
      it { expect(patch: '/profile/1').to_not route_to(action: :update, id: 1) }
      it { expect(put: '/profile/1').to_not route_to(action: :update, id: 1) }
      it { expect(get: '/profile/1/edit').to_not route_to(action: :edit, id: 1) }
    end
  end
end

describe ProfileController, type: :controller do
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

  context 'profile #index variables' do
    let(:user) { create(:user) }

    it 'shoul contain subscribes' do
      sign_in user
      create(:subscriber, user_id: user.id)
      get :index
      expect(response).to render_template :index
      expect(@controller.instance_variable_get(:@subscribed_category).count).to eq(1)
      create(:subscriber, user_id: user.id)
      get :index
      expect(@controller.instance_variable_get(:@subscribed_category).count).to eq(2)
    end

    it 'shoul contain creations' do
      sign_in user
      create(:creator, user_id: user.id)
      get :index
      expect(response).to render_template :index
      expect(@controller.instance_variable_get(:@created_category).count).to eq(1)
      create(:creator, user_id: user.id)
      get :index
      expect(@controller.instance_variable_get(:@created_category).count).to eq(2)
    end
  end
end
