class SubscribedEmailJob
  @queue = :simple

  def self.perform(user, category)
    UserMailer.subscribed_email(user, category).deliver 
    puts "Subscribed email sended"
  end
end