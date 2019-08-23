# frozen_string_literal: true

# modell for writing user actions
class UserAction < ApplicationRecord
  belongs_to :user
end
