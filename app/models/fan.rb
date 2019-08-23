# frozen_string_literal: true

# model for likes
class Fan < ApplicationRecord
  belongs_to :user
  belongs_to :image, counter_cache: true

  def to_s
    user.name
  end
end
