require 'rails_helper'

describe 'Gallery', type: :feature do
  scenario 'home page heve gallery' do
    visit root_path
    expect(page).to have_content('Gallery')
  end

  scenario 'home page have @top category' do
    visit root_path
    expect(page).to have_content(@top_category)
  end
end
