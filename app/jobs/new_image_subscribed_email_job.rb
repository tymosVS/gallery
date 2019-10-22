# frozen_string_literal: true

class NewImageSubscribedEmailJob
  @queue = :simple

  def self.perform(category)
    UserMailer.new_image_in_subscribes_email(category).deliver
    puts 'Subscribers email sended about new image'
  end
end
