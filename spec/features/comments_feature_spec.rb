# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :feature do
  
  context 'Comments' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    scenario 'create comment' do
      sign_in user
      visit category_post_path(category.id, post.id)
      text = Faker::Lorem.sentence(word_count: 20)
      fill_in 'comment[body]', with: text
      click_on 'comment'
      expect(page).to have_content(text)
    end

    scenario 'availability button for loggined users' do
      sign_in user
      visit category_post_path(category.id, post.id)
      expect(page).to have_content('comment')
    end

    scenario 'not availability button for loggouted users' do
      visit category_post_path(category.id, post.id)
      expect(page).to_not have_content('comment')
    end
  end
end
