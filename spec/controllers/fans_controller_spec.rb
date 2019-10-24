# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe FansController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(post: '/images/1/fans').to route_to('fans#create', image_id: '1') }
      it { expect(get: '/images/1/fans/new').to route_to('fans#new', image_id: '1') }
      it { expect(delete: '/images/1/fans/1').to route_to('fans#destroy', image_id: '1', id: '1') }
    end

    context 'not have' do
      it { expect(get: '/images/1/fans').to_not route_to(action: :index, image_id: 1) }
      it { expect(get: '/images/1/fans/1').to_not route_to(action: :show, image_id: 1, id: 1) }
      it { expect(patch: '/images/1/fans/1').to_not route_to(action: :update, image_id: 1, id: 1) }
      it { expect(put: '/images/1/fans/1').to_not route_to(action: :update, image_id: 1, id: 1) }
      it { expect(get: '/images/1/fans/1/edit').to_not route_to(action: :edit, category_id: 1, id: 1) }
    end
  end
end

describe FansController, type: :controller do
  context 'public methods' do
    let(:image) { create :image }
    let(:fan) { create :fan, image_id: image.id }
    let(:user) { create :user }

    it 'should delete like' do
      sign_in user
      expect { delete :destroy, params: { image_id: image.id, id: fan.id } }.to change(Fan, :count).by(1)
    end

    it 'should create like' do
      sign_in user
      expect { post :create, params: { image_id: image.id  } }.to change(Fan, :count).by(1)
    end

    it 'should not create like' do
      # must return no method eror because current_user == Nil
      expect { post :create, params: { image_id: image.id  } }.to raise_error(NoMethodError)
    end

    it 'should create only one like' do
      sign_in user
      expect { post :create, params: { image_id: image.id  } }.to change(Fan, :count).by(1)
      expect { post :create, params: { image_id: image.id  } }.to change(Fan, :count).by(0)
    end
  end

  context 'actions' do
    %i[find_image].each do |action|
      it { expect use_before_action(action) }
    end
  end

  context 'like if user log_out' do
    let(:image) { create :image }
    let(:fan) { create :fan, image_id: image.id }
    let(:user) { create :user }

    it 'do not remove like' do
      expect { delete :destroy, params: { image_id: image.id, id: fan.id } }.to raise_error(NoMethodError)
    end

    it 'do not create like' do
      expect { post :create, params: { image_id: image.id } }.to raise_error(NoMethodError)
    end
  end
end
