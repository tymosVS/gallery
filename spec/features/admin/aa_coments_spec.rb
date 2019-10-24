# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Comment, type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'user comments info in AA' do
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
  end

  context 'click buttons in AA' do
    scenario 'AA create comment' do
      usr = create(:user)
      img = create(:image)
      visit admin_user_comments_path
      click_on 'New User Comments'
      select img.title, from: 'comment[image_id]'
      select usr.name, from: 'comment[user_id]'
      fill_in 'comment[body]', with: 'Some text'
      click_on 'Create Comment'
      expect(page).to have_content(usr.name)
      expect(page).to have_content(img.title)
      expect(page).to have_content('Some text')
    end

    scenario 'AA create comment' do
      usr = create(:user)
      img = create(:image)
      visit admin_user_comments_path
      click_on 'New User Comments'
      select img.title, from: 'comment[image_id]'
      select usr.name, from: 'comment[user_id]'
      fill_in 'comment[body]', with: 'Some text'
      click_on 'Cancel'
      expect(page).to_not have_content('Some text')
    end

    scenario 'AA delete comment' do
      create(:comment)
      visit admin_user_comments_path
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept
    end
  end
end
