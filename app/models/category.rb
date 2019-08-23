# frozen_string_literal: true

# model for top lvl categories
class Category < ApplicationRecord
  paginates_per 6
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def to_s
    title
  end

  has_many :posts, dependent: :destroy
  has_many :images, through: :posts, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  has_one :creator, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
end
