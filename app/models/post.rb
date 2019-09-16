# frozen_string_literal: true

# model for connections categories with images
class Post < ApplicationRecord
  paginates_per 5
  after_create :new_image_in_subscribes_email

  belongs_to :image, dependent: :destroy
  belongs_to :category, counter_cache: true

  def to_s
    image.title
  end

  private

  def new_image_in_subscribes_email
    # Resque.enqueue(NewImageSubscribedEmailJob, category)
    UserMailer.new_image_in_subscribes_email(category).deliver
  end
end
