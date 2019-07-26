class ApplicationController < ActionController::Base

  before_action :set_cat
  private

  def set_cat
    
    # @top_categories = Category.all
    @top_categories = Category.joins(:images).group('categories.id').order('count(images.id) DESC').limit(5)
    # top = Category.images.joins(:fans, :comments).group('images.id').group('categories.id').order('count(images.id) + count(fans.id) + count(comments.id) DESC')
    # top.each do |qw|
    #   @top_categories << qw
    # end
    # img = Image.joins(:fans, :comments).group('images.id')
    # @top_categories = Category.joins(img).group('categories.id').order('count(images.id) + count(fans.id) + count(comments.id) DESC')
  end

  def after_sign_in_path_for(users)
    stored_location_for(users) || categories_path
  end
end
