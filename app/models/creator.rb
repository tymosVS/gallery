# frozen_string_literal: true

# users owners category
class Creator < ApplicationRecord
  belongs_to :user
  belongs_to :category
end
