class WelcomeEmailJob 
  @queue = :welcome

  def self.perform(user)
    UserMailer.welcome_email(user).deliver
  end
end

