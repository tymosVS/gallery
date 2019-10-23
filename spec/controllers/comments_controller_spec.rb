# frozen_string_literal: true

require 'rails_helper'

describe CommentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/comments').to route_to('comments#index')
    end

    it 'routes to #create' do
      expect(post: '/images/1/comments').to route_to('comments#create', image_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/images/1/comments/new').to route_to('comments#new', image_id: '1')
    end

    it { should route(:get, '/comments').to(action: :index) }
    it { should route(:post, '/images/1/comments').to(action: :create, image_id: 1) }
    it { should route(:get, '/images/1/comments/new').to(action: :new, image_id: 1) }
  end
end

describe CommentsController, type: :controller do
  context 'GET #index' do
    it 'should success and render index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  context 'comment #create' do
    let(:user) { create(:user) }
    let(:image) { create(:image) }
    let(:comment) { build(:comment, user_id: user.id) }
    it 'should create new comment' do
      sign_in user
      expect do
        post :create, params: { comment: { body: comment.body, user_id: user.id }, image_id: image.id }
      end.to change(Comment, :count).by(1)
    end
  end
end
