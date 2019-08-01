# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # prepend_before_action :captcha_valid, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    UserAction.new( :user_id=>current_user.id, 
                    :action=>'user sign in', 
                    :action_path=>'nil').save
  end

  # DELETE /resource/sign_out
  def destroy
    user_id = current_user.id
    super
    UserAction.new( :user_id=>user_id, 
      :action=>'user sign out', 
      :action_path=>'nil').save
  end



  # private

  #   def captcha_valid
  #     if verify_recaptcha
  #       true
  #     else
  #       self.resource = resource_class.new(sign_in_params)
  #       respond_with_navigational(resource) { render :new }
  #     end 
  #   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
