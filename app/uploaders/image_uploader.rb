# frozen_string_literal: true

# configuration for image uploder
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include Cloudinary::CarrierWave
  storage :file
  process :tags => ['image'] 

  def public_id
    return "local_test_cloudinary/" + Cloudinary::Utils.random_public_id;
  end

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  version :small_thumb do
    process resize_to_fit: [200, 200]
  end

  version :medium_thumb do
    process resize_to_fit: [400, 400]
  end

  # version :big_thumb do
  #   process resize_to_fit: [940, 940]
  # end

  def extension_whitelist
    %w[jpg jpeg png]
  end
end
