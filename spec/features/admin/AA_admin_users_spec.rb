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
end