# frozen_string_literal: true

require 'rails_helper'

describe ProfileController, type: :routing do
  describe 'routing' do
    context 'have' do
      it 'routes to #index' do
        expect(get: '/profile').to route_to('profile#index')
      end

      it { should route(:get, '/profile').to(action: :index) }
    end

    context 'not have' do
      it { should_not route(:delete, '/profile/1').to(action: :destroy, id: 1) }
      it { should_not route(:get, '/profile/new').to(action: :new) }
      it { should_not route(:post, '/profile/').to(action: :create) }
      it { should_not route(:get, '/profile/1').to(action: :show, id: 1) }
      it { should_not route(:patch, '/profile/1').to(action: :update, id: 1) }
      it { should_not route(:put, '/profile/1').to(action: :update, id: 1) }
      it { should_not route(:get, '/profile/1/edit').to(action: :edit, id: 1) }
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
