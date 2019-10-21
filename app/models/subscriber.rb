# frozen_string_literal: true

# modell for saving subscrscribes
class Subscriber < ApplicationRecord
  after_create :send_subscribed_email

  belongs_to :category
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :category_id

  def to_s
    user.name
  end
  
  private

  def send_subscribed_email
    unless Rails.env.test?
      Resque.enqueue(SubscribedEmailJob, user, category)
    end
    # UserMailer.subscribed_email(user, category).deliver 
  end
end
