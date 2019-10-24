# frozen_string_literal: true

require 'rails_helper'

describe HomePagesController, type: :routing do
  describe 'routing' do
    context 'have' do
      it 'routes to #index' do
        expect(get: '/').to route_to('home_pages#index')
      end

      it { should route(:get, '/').to(action: :index) }
    end

    context 'not have' do
      it { should_not route(:delete, '/home_pages/1').to(action: :destroy, id: 1) }
      it { should_not route(:get, '/home_pages/new').to(action: :new) }
      it { should_not route(:post, '/home_pages/').to(action: :create) }
      it { should_not route(:get, '/home_pages/1').to(action: :show, id: 1) }
      it { should_not route(:patch, '/home_pages/1').to(action: :update, id: 1) }
      it { should_not route(:put, '/home_pages/1').to(action: :update, id: 1) }
      it { should_not route(:get, '/home_pages/1/edit').to(action: :edit, id: 1) }
    end
  end
end

describe HomePagesController, type: :controller do
  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context '#index conteins' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:post) { create(:post, category_id: category.id) }
    it 'must have images from top category if exist likes and comments' do
      sign_in user
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:comment, image_id: post.image_id)
      create(:fan, image_id: post.image_id)

      get :index
      expect(@controller.instance_variable_get(:@images).count).to eq(1)
    end

    it 'not must have images from top category if not exist comments and like' do
      sign_in user
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      get :index
      expect(@controller.instance_variable_get(:@images).count).to eq(0)
    end

    it 'must have images from top category if exist likes' do
      sign_in user
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:fan, image_id: post.image_id)
      get :index
      expect(@controller.instance_variable_get(:@images).count).to eq(1)
    end

    it 'must have images from top category if exist comments' do
      sign_in user
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:post, category_id: category.id)
      create(:comment, image_id: post.image_id)
      get :index
      expect(@controller.instance_variable_get(:@images).count).to eq(1)
    end
  end
end
