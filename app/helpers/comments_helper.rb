# frozen_string_literal: true

module CommentsHelper
  def author(user_id)
    User.find(user_id).name
  end
end
