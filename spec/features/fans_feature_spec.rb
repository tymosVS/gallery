# frozen_string_literal: true

require 'rails_helper'

describe Fan, type: :feature do
  
  context 'Likes' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    scenario 'create like' do
      sign_in user
      visit category_post_path(category.id, post.id)
      click_on 'like'
    end

    scenario 'availability like for loggined users' do
      sign_in user
      visit category_post_path(category.id, post.id)
      expect(page).to have_selector('.like')
    end

    scenario 'not availability like for loggouted users' do
      visit category_post_path(category.id, post.id)
      expect(page).to_not have_selector('.like')
    end
  end

  context 'Likes dislike' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    scenario 'destroy like' do
      sign_in user
      visit category_post_path(category.id, post.id)
      click_on 'like'
      click_on 'dislike'
    end
  end
end
