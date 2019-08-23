# frozen_string_literal: true

# model for admin user in AA
class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
