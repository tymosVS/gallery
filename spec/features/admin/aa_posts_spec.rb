# frozen_string_literal: true

require 'rails_helper'

describe Post, type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'post  info in AA' do
      post = create(:post)
      category = create(:category, title: 'qweewq')
      visit admin_posts_path
      expect(page).to have_content(post.category.title)
      expect(page).to have_content(post.image.title)
      select post.category.title, from: 'q[category_id_eq]'
      click_on 'Filter'
      expect(page).to have_content(post.category.title)
      expect(page).to have_content(post.image.title)
      select category.title, from: 'q[category_id_eq]'
      click_on 'Filter'
      expect(page).to_not have_content('table')
    end
  end

  context 'click buttons in AA' do
    scenario 'AA create Post' do
      img = create(:image)
      category = create(:category)
      visit admin_posts_path
      click_on 'New Post'
      select img.title, from: 'post[image_id]'
      select category.title, from: 'post[category_id]'
      click_on 'Create Post'
      visit admin_posts_path
      expect(page).to have_content(img.title)
      expect(page).to have_content(category.title)
    end

    scenario 'AA cancel create Post' do
      img = create(:image)
      category = create(:category)
      visit admin_posts_path
      click_on 'New Post'
      select img.title, from: 'post[image_id]'
      select category.title, from: 'post[category_id]'
      click_on 'Cancel'
      expect(page).to_not have_content(img.title)
    end

    scenario 'AA delete Post' do
      create(:post)
      visit admin_posts_path
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept
    end
  end
end
