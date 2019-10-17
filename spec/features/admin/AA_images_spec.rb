# frozen_string_literal: true

require 'rails_helper'

describe Image, type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'images info in AA' do
      post = create(:post)
      fan = create(:fan)
      category = create(:category, title: 'qweewq')
      visit admin_images_path
      select post.category.title, from: 'q[containing_category_in]'
      click_on 'Filter'
      expect(page).to have_content(post.image.title)
      select category.title, from: 'q[containing_category_in]'
      click_on 'Filter'
      expect(page).to_not have_content(post.image.title)
      select fan.user.name, from: 'q[fans_id_eq]'
      select 'Any', from: 'q[containing_category_in]'
      click_on 'Filter'
      expect(page).to have_content(fan.image.title)
    end
  end

  context 'click buttons in AA' do
    scenario 'AA create image' do
      sign_in admin
      visit admin_images_path
      click_on 'New Image'
      fill_in 'image[title]', with: 'TitleImg'
      attach_file('image[image]', Rails.root.join('app', 'assets', 'images', 'default.jpeg'))
      click_on 'Create Image'
      expect(page).to have_content('TitleImg')
    end

    scenario 'AA cancel create image' do
      visit admin_images_path
      click_on 'New Image'
      fill_in 'image[title]', with: 'TitleImg'
      attach_file('image[image]', Rails.root.join('app', 'assets', 'images', 'default.jpeg'))
      click_on 'Cancel'
      expect(page).to_not have_content('TitleImg')
    end

    scenario 'AA delete image' do
      create(:image)
      visit admin_images_path
      click_on 'Table'
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept
    end
  end
end