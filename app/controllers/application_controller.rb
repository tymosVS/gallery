class ApplicationController < ActionController::Base
  before_action :top_category
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :tracking, only: [:index, :show] 
  before_action :set_locale


  private
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def top_category
    @top_categories = Category.left_outer_joins(:images).select('categories.id, '\
                      'categories.title,'\
                      'categories.posts_count + sum(images.comments_count) '\
                      '+sum(images.fans_count) as total').
                      group('categories.id').where("categories.posts_count > 0").where.not(title: "Non_categorizated", 
                      description: 'Images no category').
                      order('total DESC').limit(5)
  end

  def tracking
    UserAction.new( :user_id=>current_user.id, 
      :action=>'navigation', 
      :action_path=>request.original_url).save if user_signed_in?
  end

  def configure_permitted_parameters
    added_attrs = [:name, :avatar, :date_of_birth]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs.slice(0,2))
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
