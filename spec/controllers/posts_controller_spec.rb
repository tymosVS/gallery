# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe PostsController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(get: '/categories/1').to route_to('posts#index', category_id: '1') }
      it { expect(post: '/categories/1').to route_to('posts#create', category_id: '1') }
      it { expect(get: '/categories/1/new').to route_to('posts#new', category_id: '1') }
      it { expect(get: '/categories/1/1').to route_to('posts#show', category_id: '1', id: '1') }
    end

    context 'not have' do
      it { expect(delete: '/categories/1/1').to_not route_to(action: :destroy, category_id: 1, id: 1) }
      it { expect(patch: '/categories/1/1').to_not route_to(action: :update, category_id: 1, id: 1) }
      it { expect(put: '/categories/1/1').to_not route_to(action: :update, category_id: 1, id: 1) }
      it { expect(get: '/categories/1/1/edit').to_not route_to(action: :edit, category_id: 1, id: 1) }
    end
  end
end

describe PostsController, type: :controller do
  context 'posts #index' do
    let(:category) { create(:category) }
    it 'should success and render to index page' do
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context 'posts #show' do
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    it 'should success and render to show page' do
      get :show, params: { category_id: category.id, id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  context 'posts #show' do
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    it 'should success and render to show page' do
      get :show, params: { category_id: category.id, id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  context 'posts #create' do
    let(:category) { create(:category) }
    let(:image) { create(:image) }

    it 'should create new post' do
      expect do
        post :create, params: { image: { image: image.image, title: image.title }, category_id: category.id }
      end.to change(Image, :count).by(1)
    end

    it 'should render template#new if wrong image path' do
      # sign_in user
      post :create, params: { image: { image: nil, title: image.title }, category_id: category.id }
      assert_template :new
    end

    it 'should render template#new if wrong image title' do
      # sign_in user
      img = { image: { image: image.image, title: nil }, category_id: category.id }
      post :create, params: img
      assert_template :new
    end
  end
end
