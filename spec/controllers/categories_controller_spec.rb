require 'rails_helper'

describe "GET #index" do
  it "populates an array of categories" do
    category = create(:category)


    expect(page).to have_title(category.title)
  

  end
end