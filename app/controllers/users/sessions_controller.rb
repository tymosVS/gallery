# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    flash.clear
    user = User.find_by_email(sign_in_params['email'])
    super && return unless user
    adjust_failed_attempts user
    super && return if (user.failed_attempts < User.logins_before_captcha)
    super && return if user.locked_at || verify_recaptcha
    decrement_failed_attempts(user) if recaptcha_present?(params) && !verify_recaptcha
    self.resource = resource_class.new(sign_in_params)
    sign_out
    flash[:error] = 'Captcha was wrong, please try again.'
    respond_with_navigational(resource) { render :new }
  end

  # DELETE /resource/sign_out
  def destroy
    user_id = current_user.id
    super
    UserAction.new(user_id: user_id, action: 'user sign out', action_path: 'nil').save
  end

  private

  def adjust_failed_attempts(user)
    if user.failed_attempts > user.cached_failed_attempts
      user.update cached_failed_attempts: user.failed_attempts
    else
      increment_failed_attempts(user)
    end
  end

  def increment_failed_attempts(user)
    user.increment :cached_failed_attempts
    user.update failed_attempts: user.cached_failed_attempts
  end

  def decrement_failed_attempts(user)
    user.decrement :cached_failed_attempts
    user.update failed_attempts: user.cached_failed_attempts
  end

  def recaptcha_present?(params)
    params[:recaptcha_challenge_field]
  end

  def after_sign_in_path_for(resource)
    resource.update cached_failed_attempts: 0, failed_attempts: 0
    UserAction.new(user_id: current_user.id, action: 'user sign in', action_path: 'nil').save
    stored_location_for(@user) || categories_path
  end
end
