require "simplecov"
SimpleCov.start

require 'rails_helper'

describe Category, type: :feature do
  context 'categories tests' do
    let(:category) {create(:category) }
    let(:user) { create(:user) }

    scenario 'categories have title gallery' do
      visit categories_path
      expect(page).to have_content('Categories')
    end

    scenario 'categories not have button Create category' do
      visit categories_path
      expect(page).to_not have_content('Create category')
    end

    scenario 'categories have button Create category after login' do
      sign_in user
      visit categories_path
      expect(page).to have_content('Create category')
    end

    scenario 'button Create disappears after logout' do
      sign_in user
      visit categories_path
      expect(page).to have_content('Create category')
      sign_out user
      visit categories_path
      expect(page).to_not have_content('Create category')
    end

    scenario 'create category' do
      sign_in user
      visit categories_path
      expect(page).to have_content('Create category')
      click_on 'Create category'
      fill_in "category[title]", with: 'catTitle'
      fill_in "category[description]", with: 'someDesc'
      click_on 'Save Category'
      expect(Category.count).to eq(1)
    end
  end
end