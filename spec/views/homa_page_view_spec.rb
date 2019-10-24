# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe 'home_page/index', type: :view do
  it 'home page content' do
    @statistic = [Image.count, Fan.count, Comment.count]
    render template: 'home_pages/index'
    expect(rendered).to match 'h1'
    expect(rendered).to match 'Gallery'
    expect(rendered).to match '<h2>About Gallery</h2>'
    expect(rendered).to match '<h2>Popular</h2>'
  end
end
