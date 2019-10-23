# frozen_string_literal: true

require 'rails_helper'

describe FansController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/images/1/fans').to route_to('fans#create', image_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/images/1/fans/new').to route_to('fans#new', image_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/images/1/fans/1').to route_to('fans#destroy', image_id: '1', id: '1')
    end

    it { should route(:post, '/images/1/fans').to(action: :create, image_id: 1) }
    it { should route(:get, '/images/1/fans/new').to(action: :new, image_id: 1) }
    it { should route(:delete, '/images/1/fans/1').to(action: :destroy, image_id: 1, id: 1) }
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
