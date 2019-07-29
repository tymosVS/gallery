class UserMailer < ApplicationMailer
  default from: ENV['MAILER_EMAIL']

  def welcome_email(params)
    @user = params
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user['email'], subject: 'Welcome to My gallery Site')
  end
end
