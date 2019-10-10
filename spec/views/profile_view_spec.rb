# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe 'profile/index', type: :view do
  
  it 'profile must have info about user' do
    user = create(:user)
    @created_category = {}
    @subscribed_category = {}
    sign_in user
    render :template => 'profile/index'
    expect(rendered).to match 'h1'
    expect(rendered).to match 'container'
    expect(rendered).to match user.email
  end
end
