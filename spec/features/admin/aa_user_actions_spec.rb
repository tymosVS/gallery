require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe 'User Actions', type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'User Actions' do
      create(:user_action, action: 'Navigation')
      visit admin_user_actions_path
      expect(page).to have_content('Navigation')
    end
  end
end
