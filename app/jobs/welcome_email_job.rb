class WelcomeEmailJob 
  @queue = :simple

  def self.perform(user)
    UserMailer.welcome_email(user).deliver
    puts "Job is "
  end
end

