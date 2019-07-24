class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
  
  has_many :posts, dependent: :destroy
  has_many :images, through: :posts, dependent: :destroy
  has_many :subscribers
  has_one :creator

  validates :title, presence: true,
  length: { minimum: 2 }
end
