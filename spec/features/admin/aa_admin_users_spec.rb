require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe AdminUser, type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'Admins info in AA' do
      admin = create(:admin_user)
      visit admin_admin_users_path
      expect(page).to have_content(admin.email)
    end
  end

  context 'click buttons in AA' do
    scenario 'AA delete Admin User' do
      visit admin_admin_users_path
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept
    end
  end

  context 'click buttons in AA' do
    scenario 'AA create image' do
      visit admin_admin_users_path
      click_on 'New Admin'
      fill_in 'admin_user[email]', with: 'foo@bar.com'
      fill_in 'admin_user[password]', with: 'qwerty'
      fill_in 'admin_user[password_confirmation]', with: 'qwerty'
      click_on 'Create Admin user'
      expect(page).to have_content('foo@bar.com')
      click_on 'Edit Admin User'
      fill_in 'admin_user[email]', with: 'baz@bar.com'
      fill_in 'admin_user[password]', with: 'ytrewq'
      fill_in 'admin_user[password_confirmation]', with: 'ytrewq'
      click_on 'Update Admin user'
      expect(page).to have_content('baz@bar.com')
    end
  end
end
