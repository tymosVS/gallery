class ApplicationController < ActionController::Base
  before_action :set_cat
  before_action :tracking, only: [:index, :show]

  private

  def set_cat
    # @top_categories = Post.joins(:image, :category).left_joins(:fan, :comment)
    @top_categories = ActiveRecord::Base.connection.execute('SELECT 
                      categories.id, categories.title, count(images.id) + 
                      count(fans.id) + count(comments.id) as total 
                      from categories
                      left join posts on posts.category_id = categories.id 
                      left join images on images.id = posts.image_id 
                      left join fans on fans.image_id = images.id 
                      left join comments on comments.image_id = images.id 
                      group by categories.id 
                      order by total DESC limit 5')
  end

  def tracking
    UserAction.new( :user_id=>current_user.id, 
      :action=>'navigation', 
      :action_path=>request.original_url).save if user_signed_in?
  end
  
  def after_sign_in_path_for(users)
    stored_location_for(users) || categories_path
  end
end
