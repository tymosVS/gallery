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
  end
end

describe FansController,  type: :controller do

  context 'public methods' do
    let(:image) { create :image }
    let(:fan) { create :fan, image_id: image.id }
    let(:user) { create :user}

    it 'should delete like' do
      sign_in user
      expect { delete :destroy, params: { image_id: image.id , id: fan.id } }.to change(Fan, :count).by(1)
    end

    it 'should create like' do
      sign_in user
      expect { post :create, params: { image_id: image.id  } }.to change(Fan, :count).by(1)
    end
  end
end