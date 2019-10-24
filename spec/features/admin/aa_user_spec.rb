# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe User, type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'user  info in AA' do
      usrer = create(:user)
      visit admin_users_path
      expect(page).to have_content(usrer.email)
      expect(page).to have_content(usrer.name)
    end
  end

  context 'click buttons in AA' do
    scenario 'AA create user' do
      visit admin_users_path
      click_on 'New User'
      fill_in 'user[name]', with: 'userName'
      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: '1598753'
      click_on 'Create User'
      expect(page).to have_content('user@user.com')
      expect(page).to have_content('userName')
    end

    scenario 'AA cancel create user' do
      visit admin_users_path
      click_on 'New User'
      fill_in 'user[name]', with: 'userName'
      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: '1598753'
      click_on 'Cancel'
      expect(page).to_not have_content('user@user.com')
      expect(page).to_not have_content('userName')
    end

    scenario 'AA delete User' do
      create(:user)
      visit admin_users_path
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept
    end
  end
end
