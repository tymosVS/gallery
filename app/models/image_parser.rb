# frozen_string_literal: true

# model for save url image from other site
class ImageParser < ApplicationRecord

  validates :image_url, presence: true

end
