# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    UserAction.new( :user_id=>current_user.id, 
                    :action=>'user sign in', 
                    :action_path=>request.original_url).save
  end

  # DELETE /resource/sign_out
  def destroy
    user_id = current_user.id
    super
    UserAction.new( :user_id=>user_id, 
      :action=>'user sign out', 
      :action_path=>request.original_url).save
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
