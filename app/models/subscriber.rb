# frozen_string_literal: true

# modell for saving subscrscribes
class Subscriber < ApplicationRecord
  after_create :send_subscribed_email

  belongs_to :category
  belongs_to :user

  private

  def send_subscribed_email
    Resque.enqueue(SubscribedEmailJob, user, category)
  end
end
