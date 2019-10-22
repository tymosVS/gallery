# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(*)
    profile_path
  end
end
