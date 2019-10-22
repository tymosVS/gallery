require 'rails_helper'

describe 'Dashbord', type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'Dashbord last 5 comments' do
      comments = []
      6.times { comments.push(create(:comment)) }
      visit admin_dashboard_path
      comments[1..].each { |comment| expect(page).to have_content(comment.body) }
      expect(page).to_not have_content(comments[0].body)
    end

    scenario 'Dashbord last 5 categories' do
      categories = []
      5.times { |i| categories.push(create(:category, title: "qwe#{i}")) }
      visit admin_dashboard_path
      categories.each { |category| expect(page).to have_content(category.title.capitalize) }
    end
  end
end
