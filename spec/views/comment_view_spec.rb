# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe 'comments/index', type: :view do
  it 'index must heve comments' do
    comment = create(:comment)
    @comments = Comment.all.order(:created_at).reverse_order.page params[:page]

    render template: 'comments/index'

    expect(rendered).to match 'h1'
    expect(rendered).to match comment.body
    expect(rendered).to match comment.user.name
  end
end
