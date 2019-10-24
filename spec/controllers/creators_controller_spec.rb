# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe CreatorsController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(get: '/creators/new').to route_to('creators#new') }
      it { expect(post: '/creators').to route_to('creators#create') }
    end

    context 'not have' do
      it { expect(get: '/creators').to_not route_to(action: :index) }
      it { expect(delete: '/home_pages/1').to_not route_to(action: :destroy, id: 1) }
      it { expect(get: '/home_pages/1').to_not route_to(action: :show, id: 1) }
      it { expect(patch: '/home_pages/1').to_not route_to(action: :update, id: 1) }
      it { expect(put: '/home_pages/1').to_not route_to(action: :update, id: 1) }
      it { expect(get: '/home_pages/1/edit').to_not route_to(action: :edit, id: 1) }
    end
  end
end

describe CreatorsController, type: :controller do
  context 'creator #create' do
    let(:user) { create(:user) }
    let(:category) { build(:category) }
    it 'should create new category' do
      sign_in user
      expect do
        post :create, params: { category: { title: category.title, description: category.description } }
      end.to change(Category, :count).by(1)
    end

    it 'if wrong params should genere #new template' do
      sign_in user
      post :create, params: { category: { title: nil, description: category.description } }
      assert_template :new
    end

    it 'description optional param' do
      sign_in user
      post :create, params: { category: { title: category.title, description: nil } }
      assert_response :redirect
    end
  end

  context 'actions' do
    %i[find_user].each do |action|
      it { expect use_before_action(action) }
    end
  end

  context 'creator #create for log_outed user' do
    let(:user) { create(:user) }
    let(:category) { build(:category) }

    it 'rese eror in create if user_sign_out' do
      expect do
        post :create, params: { category: { title: category.title, description: category.description } }
      end.to raise_error(NoMethodError)
    end
  end
end
