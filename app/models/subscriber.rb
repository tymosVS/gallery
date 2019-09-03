# frozen_string_literal: true

# modell for saving subscrscribes
class Subscriber < ApplicationRecord
  after_create :send_subscribed_email

  belongs_to :category
  belongs_to :user

  def to_s
    user.name
  end

  private

  def send_subscribed_email
    begin
      Resque.enqueue(SubscribedEmailJob, user, category)
    rescue Redis::CannotConnectError
      UserMailer.subscribed_email(user, category).deliver 
    end
    
  end
end
