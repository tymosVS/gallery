# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: ENV['MAILER_EMAIL']

  def welcome_email(user)
    @user = user
    mail(to: @user['email'], subject: 'Welcome to My gallery Site')
  end

  def subscribed_email(user, category)
    @user = user
    @category = category
    mail(to: @user['email'], subject: 'Succesfull subscribed')
  end

  def new_image_in_subscribes_email(category)
    @category = Category.find(category['id'])
    @users_mail = []
    @category.subscribers.each do |cat|
      @users_mail << User.find(cat.user_id).email
    end
    mail(to: @users_mail, subject: 'New image in subscribed category') unless @users_mail.empty?
  end
end
