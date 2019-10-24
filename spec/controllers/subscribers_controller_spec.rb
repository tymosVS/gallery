# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe SubscribersController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(post: '/categories/1/subscribers').to route_to('subscribers#create', category_id: '1') }
      it { expect(get: '/categories/1/subscribers/new').to route_to('subscribers#new', category_id: '1') }

      it 'routes to #destroy' do
        expect(delete: '/categories/1/subscribers/1').to route_to('subscribers#destroy', category_id: '1', id: '1')
      end
    end

    context 'not have' do
      it { expect(get: '/categories/1/subscribers').to_not route_to(action: :index, category_id: 1) }
      it { expect(get: '/categories/1/subscribers/1').to_not route_to(action: :show, category_id: 1, id: 1) }
      it { expect(patch: '/categories/1/subscribers/1').to_not route_to(action: :update, category_id: 1, id: 1) }
      it { expect(put: '/categories/1/subscribers/1').to_not route_to(action: :update, category_id: 1, id: 1) }
      it { expect(get: '/categories/1/subscribers/1/edit').to_not route_to(action: :edit, category_id: 1, id: 1) }
    end
  end
end

describe SubscribersController, type: :controller do
  context 'subscriptions #create' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }

    it 'should create new subscriptions' do
      sign_in user
      expect { post :create, params: { category_id: category.id } }.to change(Subscriber, :count).by(1)
    end

    it 'should create only one subscriptions' do
      sign_in user
      expect { post :create, params: { category_id: category.id } }.to change(Subscriber, :count).by(1)
      expect { post :create, params: { category_id: category.id } }.to change(Subscriber, :count).by(0)
    end

    it 'subscriptions not create if user log out' do
      # must return no method eror because current_user == Nil
      expect { post :create, params: { category_id: category.id } }.to raise_error(NoMethodError)
    end
  end

  context 'actions' do
    %i[find_components].each do |action|
      it { should use_before_action(action) }
    end
  end

  context 'subscriptions #destroy' do
    let(:user) { create(:user) }
    let(:subscriber) { create(:subscriber) }

    it 'should delete  subscriptions' do
      sign_in user
      expect do
        delete :destroy, params: { category_id: subscriber.category_id, id: subscriber.id }
      end.to change(Subscriber, :count).by(1)
    end
  end
end
