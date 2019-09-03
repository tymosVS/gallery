# frozen_string_literal: true

class Image < ApplicationRecord
  paginates_per 20
  has_one :post, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :fans, dependent: :destroy
  ransacker :containing_category,
            formatter: ->(v) {ids = Post.where(category_id: v).pluck(:image_id);
                              ids.present? ? ids : nil
                              } do |image|
    image.table[:id]
  end
  mount_uploader :image, ImageUploader

  has_attached_file :image, 
  :styles => { :small_thumb => "200x200>", :medium_thumb => "400x400>", :big_thumb => "940x0>" }, 
  :default_url => "/images/:style/"

  validates :title, presence: true, length: { minimum: 2 }
  validates :image, presence: true,
            file_size: { less_than_or_equal_to: 50.megabytes }
end
