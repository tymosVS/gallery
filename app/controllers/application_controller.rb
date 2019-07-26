class ApplicationController < ActionController::Base

  before_action :set_cat
  private

  def set_cat
    
    @top_categories = Category.all
  end

  def after_sign_in_path_for(users)
    stored_location_for(users) || categories_path
  end
end
