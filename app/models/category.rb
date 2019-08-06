class Category < ApplicationRecord
  paginates_per 5
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
  
  has_many :posts, dependent: :destroy
  has_many :images, through: :posts, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  has_one :creator, dependent: :destroy

  validates :title, presence: true,
  length: { minimum: 2 }
end
