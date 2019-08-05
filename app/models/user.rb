class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email

  has_many :comments, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  has_many :creators, dependent: :destroy
  has_many :fans, dependent: :destroy
  has_many :user_actions, dependent: :destroy
  
  def self.logins_before_captcha
    3
  end
  
  def self.find_for_facebook_oauth access_token
    if user = User.where(:email => access_token.extra.raw_info.email).first
      user
    else 
      User.create!(
                    :name => access_token.extra.raw_info.name,  
                    :email => access_token.extra.raw_info.email, 
                    :password => Devise.friendly_token[0,20]) 
    end
  end
  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :omniauthable,
        :confirmable
        # :lockable

  private

  def send_welcome_email()
    # UserMailer.welcome_email(self).deliver
    user = self
    Resque.enqueue(WelcomeEmailJob, user)
  end 
end
