require 'rails_helper'

describe 'Dashbord', type: :feature do
  let(:admin) { create(:admin_user) }

  before(:each) do
    sign_in admin
  end

  context 'test pages Active Admin' do
    scenario 'Dashbord last 5 comments' do
      comment1 = create(:comment, body: 'fixed body value')
      comment2 = create(:comment)
      comment3 = create(:comment)
      comment4 = create(:comment)
      comment5 = create(:comment)
      comment6 = create(:comment)
      visit admin_dashboard_path
      expect(page).to_not have_content(comment1.body)
      expect(page).to have_content(comment2.body)
      expect(page).to have_content(comment3.body)
      expect(page).to have_content(comment4.body)
      expect(page).to have_content(comment5.body)
      expect(page).to have_content(comment6.body)
    end

    scenario 'Dashbord last 5 categories' do
      category1 = create(:category, title: 'qwe')
      category2 = create(:category, title: 'qwe2')
      category3 = create(:category, title: 'qwe3')
      category4 = create(:category, title: 'qwe4')
      category5 = create(:category, title: 'qwe6')

      visit admin_dashboard_path
      expect(page).to have_content(category1.title.capitalize)
      expect(page).to have_content(category2.title.capitalize)
      expect(page).to have_content(category3.title.capitalize)
      expect(page).to have_content(category4.title.capitalize)
      expect(page).to have_content(category5.title.capitalize)
    end
  end
end
