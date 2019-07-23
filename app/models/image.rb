class Image < ApplicationRecord
  has_one :post, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :fans, dependent: :destroy


  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {minimum: 2}
  validates :image, presence: true, 
            file_size: { less_than_or_equal_to: 50.megabytes }
end
