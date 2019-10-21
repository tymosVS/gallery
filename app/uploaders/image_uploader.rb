# frozen_string_literal: true

# configuration for image uploder
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small_thumb do
    process resize_to_fit: [200, 200]
  end

  version :medium_thumb do
    process resize_to_fit: [400, 400]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end
end
