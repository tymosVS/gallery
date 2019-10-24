# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe CommentsController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(get: '/comments').to route_to('comments#index') }
      it { expect(post: '/images/1/comments').to route_to('comments#create', image_id: '1') }
      it { expect(get: '/images/1/comments/new').to route_to('comments#new', image_id: '1') }
    end

    context 'not have' do
      it { expect(delete: '/images/1/comments/1').to_not route_to(action: :destroy, image_id: 1, id: 1) }
      it { expect(get: '/images/1/comments/1').to_not route_to(action: :show, image_id: 1, id: 1) }
      it { expect(patch: '/images/1/comments/1').to_not route_to(action: :update, image_id: 1, id: 1) }
      it { expect(put: '/images/1/comments/1').to_not route_to(action: :update, image_id: 1, id: 1) }
      it { expect(get: '/images/1/comments/1/edit').to_not route_to(action: :edit, image_id: 1, id: 1) }
    end
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

  context 'actions' do
    %i[trak_action].each do |action|
      it { expect use_after_action(action) }
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
