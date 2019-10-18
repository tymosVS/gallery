# frozen_string_literal: true

require 'rails_helper'

describe Admin::ImagesController, type: :controller do
  let(:admin_user) { create(:admin_user) }

  it 'returns http success' do
    sign_in admin_user
    get :index
    expect(response).to have_http_status(:success)
    expect(response).to render_template :index
  end
end
