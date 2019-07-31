class Subscriber < ApplicationRecord
  after_create :send_subscribed_email#, if: !already_subscribed?

  belongs_to :category
  belongs_to :user

  private

  def send_subscribed_email
    # UserMailer.subscribed_email(user, category).deliver 
    # Resque.enqueue(SubscribedEmailJob, user, category)
    Resque.enqueue(SubscribedEmailJob, user, category)
  end 
end
