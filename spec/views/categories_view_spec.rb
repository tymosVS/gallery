# frozen_string_literal: true

require 'rails_helper'

describe 'categories/index', type: :view do
  it 'categories' do
    category = create(:category)
    @categories = Category.all.page params[:page]
    @category_images = {}
    @pre_sub = {}
    @category_owners = {}
    @category_owners[category] = false

    render template: 'categories/index'

    expect(rendered).to match 'h1'
    expect(rendered).to match 'container'
    expect(rendered).to match category.description
    expect(rendered).to match category.title.upcase
  end
end
