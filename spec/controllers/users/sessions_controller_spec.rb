require 'rails_helper'

describe Users::SessionsController, type: :routing do
  describe 'routing' do
    context 'have' do
      it { expect(get: '/users/sign_in').to route_to('users/sessions#new') }
      it { expect(post: '/users/sign_in').to route_to('users/sessions#create') }
      it { expect(delete: '/users/sign_out').to route_to('users/sessions#destroy') }
    end
  end
end

describe Users::SessionsController, type: :controller do
  let(:user) { create(:user) }
  it 'signs user in and out' do
    sign_in user
    # get authenticated_root_path
    expect(controller.current_user).to eq(user)
    sign_out user
    # get authenticated_root_path
    expect(controller.current_user).to be_nil
  end
end
