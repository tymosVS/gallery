require "simplecov"
SimpleCov.start

require 'rails_helper'

describe Users::SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/sign_in').to route_to('users/sessions#new')
    end

    it 'routes to #create' do
      expect(post: '/users/sign_in').to route_to('users/sessions#create')
    end

    it 'routes to #delete' do
      expect(delete: '/users/sign_out').to route_to('users/sessions#destroy')
    end
  end
end

describe Users::SessionsController,  type: :controller do
  let(:user) { create(:user)}
  it "signs user in and out" do    
    sign_in user
    # get authenticated_root_path
    expect(controller.current_user).to eq(user)
    
    sign_out user
    # get authenticated_root_path
    expect(controller.current_user).to be_nil
  end
end
