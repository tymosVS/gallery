class ApplicationController < ActionController::Base
  def after_sign_in_path_for(users)
    categories_path
  end

end
