class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
    @category_images = {}
    @category_owners = {}
    @categories.each do |category|
      @category_images[category] = category.images.first if category.images.size > 0
      if Creator.exists?(:category_id=>category.id) && user_signed_in?
        creator = Creator.where(:category_id=>category.id).first
        @category_owners[category] = creator.user_id == current_user.id
      else
        @category_owners[category] = false
      end
    end
  end

  def edit
  end

  def show
    redirect_to category_posts_path(@category)
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @category.destroy
  
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
