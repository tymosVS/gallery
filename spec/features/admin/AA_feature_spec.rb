# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :feature do
  context 'test pages Active Admin' do
    let(:admin) { create(:admin_user) }

    scenario 'user comments info in AA' do
      sign_in admin
      visit admin_user_comments_path
      expect(page).to have_content('User Comments')
      comment = create(:comment)
      visit admin_user_comments_path
      expect(page).to have_content(comment.body)
      expect(page).to have_content(comment.user.name)
      select comment.user.name, from: 'q[user_id_eq]'
      click_on 'Filter'
      expect(page).to have_content(comment.body)
      user = create(:user)
      visit admin_user_comments_path
      select user.name, from: 'q[user_id_eq]'
      click_on 'Filter'
      expect(page).to_not have_content(comment.body)
    end

    scenario 'categories info in AA' do
      sign_in admin
      creator = create(:creator)
      visit admin_categories_path
      expect(page).to have_content(creator.user.name)
      expect(page).to have_content(creator.category.title)
    end

    scenario 'images info in AA' do
      sign_in admin
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

    scenario 'user  info in AA' do
      sign_in admin
      usrer = create(:user)
      visit admin_users_path
      expect(page).to have_content(usrer.email)
      expect(page).to have_content(usrer.name)
    end

    scenario 'post  info in AA' do
      sign_in admin
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
    let(:admin) { create(:admin_user) }

    scenario 'user  create in AA' do
      sign_in admin
      visit admin_users_path
      click_on 'New User'
      fill_in 'user[name]', with: 'userName'
      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: '1598753'
      click_on 'Create User'
      expect(page).to have_content('user@user.com')
      expect(page).to have_content('userName')
    end

    scenario 'user cancel create in AA' do
      sign_in admin
      visit admin_users_path
      click_on 'New User'
      fill_in 'user[name]', with: 'userName'
      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: '1598753'
      click_on 'Cancel'
      expect(page).to_not have_content('user@user.com')
      expect(page).to_not have_content('userName')
    end

    scenario 'images info in AA' do
      sign_in admin
      visit admin_categories_path
      click_on 'New Category'
      fill_in 'category[title]', with: 'Title4'
      fill_in 'category[description]', with: 'Some text'
      click_on 'Create Category'
      expect(page).to have_content('Title4')
      expect(page).to have_content('Some text')
    end

    scenario 'images info in AA' do
      sign_in admin
      visit admin_categories_path
      click_on 'New Category'
      fill_in 'category[title]', with: 'Title4'
      fill_in 'category[description]', with: 'Some text'
      click_on 'Cancel'
      expect(page).to_not have_content('Title4')
      expect(page).to_not have_content('Some text')
    end

    scenario 'images info in AA' do
      sign_in admin
      visit admin_images_path
      click_on 'New Image'
      fill_in 'image[title]', with: 'TitleImg'
      attach_file('image[image]', Rails.root.join('app', 'assets', 'images', 'default.jpeg'))
      click_on 'Create Image'
      expect(page).to have_content('TitleImg')
    end

    scenario 'images info in AA' do
      sign_in admin
      visit admin_images_path
      click_on 'New Image'
      fill_in 'image[title]', with: 'TitleImg'
      attach_file('image[image]', Rails.root.join('app', 'assets', 'images', 'default.jpeg'))
      click_on 'Cancel'
      expect(page).to_not have_content('TitleImg')
    end
  end
end
