# frozen_string_literal: true

class WelcomeEmailJob
  @queue = :welcome

  def self.perform(user)
    UserMailer.welcome_email(user).deliver
  end
end
