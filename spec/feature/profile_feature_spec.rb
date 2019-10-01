require "simplecov"
SimpleCov.start

require 'rails_helper'

describe 'Profile', type: :feature do
  let(:user) { create(:user) }

  scenario 'Profile contein user info' do
    sign_in user
    visit profile_path
    expect(page).to have_content('Profile')
    expect(page).to have_content(user.email)
  end

  scenario 'Profile rerect to Sign in' do
    visit profile_path
    expect(page).to have_content('Sign in')
  end

  scenario 'Profile rerect to Sign in' do
    visit profile_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_on 'sign_in'
    visit profile_path
    expect(page).to have_content(user.email)
  end

  scenario 'when created category in profile appear block My category' do
    sign_in user
    visit categories_path
    expect(page).to have_content('Create category')
    click_on 'Create category'
    fill_in "category[title]", with: 'catTitle'
    fill_in "category[description]", with: 'description'
    click_on 'Save Category'
    visit profile_path
    expect(page).to have_content('My categories')
  end

  scenario 'Delete user category' do
    sign_in user
    visit categories_path
    click_on 'Create category'
    fill_in "category[title]", with: 'catTitle'
    fill_in "category[description]", with: 'description'
    click_on 'Save Category'
    visit profile_path
    click_on 'Destroy'
    page.driver.browser.switch_to.alert.accept
    expect(page).to_not have_content('My categories')
  end
end
