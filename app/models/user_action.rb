# frozen_string_literal: true

# modell for writing user actions
class UserAction < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :action, presence: true
  
end
