require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Category, type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'categories info in AA' do
      creator = create(:creator)
      visit admin_categories_path
      expect(page).to have_content(creator.user.name)
      expect(page).to have_content(creator.category.title)
    end
  end

  context 'click buttons in AA' do
    scenario 'AA create category' do
      visit admin_categories_path
      click_on 'New Category'
      fill_in 'category[title]', with: 'Title4'
      fill_in 'category[description]', with: 'Some text'
      click_on 'Create Category'
      expect(page).to have_content('Title4')
      expect(page).to have_content('Some text')
    end

    scenario 'AA cancel create category' do
      visit admin_categories_path
      click_on 'New Category'
      fill_in 'category[title]', with: 'Title4'
      fill_in 'category[description]', with: 'Some text'
      click_on 'Cancel'
      expect(page).to_not have_content('Title4')
      expect(page).to_not have_content('Some text')
    end

    scenario 'AA delete Category' do
      create(:category)
      visit admin_categories_path
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept
    end
  end
end
