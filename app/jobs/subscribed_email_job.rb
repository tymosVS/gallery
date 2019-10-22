# frozen_string_literal: true

class SubscribedEmailJob
  @queue = :subscribe

  def self.perform(user, category)
    UserMailer.subscribed_email(user, category).deliver
    puts 'Subscribed email sended'
  end
end
