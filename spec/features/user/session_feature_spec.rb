# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe 'Profile', type: :feature do
  context 'FB' do
    scenario 'check move to FB' do
      visit new_user_session_path
      click_on 'Sign in with Facebook'
      expect(page).to have_content('Log Into Facebook')
    end
  end

  context 'sign in' do
    let(:user) { create(:user)}
    scenario 'simple sig_in' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'Log in'
    end
  end
end
