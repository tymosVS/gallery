# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :feature do
  
  context 'create post' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    scenario 'Create post in category' do
      sign_in user
      visit category_posts_path(category.id)
      click_on 'Add image'
      fill_in 'image[title]', with: 'imageTitle'
      find('form input[type="file"]').set(Rails.root.join('spec/fixtures/images/default.jpg'))
      click_on 'Save Image'
      expect(page).to have_content('imageTitle'.capitalize)
    end
  end

  context 'check content' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:post) { create(:post, category_id: category.id) }

    scenario 'Show Add add image if user sig in' do
      sign_in user
      visit category_posts_path(category.id)
      expect(page).to have_content('Add image')
    end

    scenario 'not show Add image if user sig out' do
      visit category_posts_path(category.id)
      expect(page).to_not have_content('Add image')
    end
  end
end
