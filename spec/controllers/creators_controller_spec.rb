# frozen_string_literal: true

require 'rails_helper'

describe CreatorsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/creators/new').to route_to('creators#new')
    end

    it 'routes to #create' do
      expect(post: '/creators').to route_to('creators#create')
    end

    it { should route(:post, '/creators').to(action: :create) }
    it { should route(:get, '/creators/new').to(action: :new) }
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
