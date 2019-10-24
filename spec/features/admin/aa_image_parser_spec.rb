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
      visit admin_image_parsers_path
      expect(page).to have_content('New Image Parser')
    end
  end

  context 'click buttons in AA' do
    scenario 'parse image' do
      visit admin_image_parsers_path
      click_on 'New Image Parser'
      fill_in 'image_parser_site_path', with: 'http://www.cubecinema.com/programme'
      click_on 'Create Image parser'
      find(:css, '#collection_selection_toggle_all').set(true)
      click_on 'Batch Actions'
      click_on 'Import Selected'
    end
  end
end
