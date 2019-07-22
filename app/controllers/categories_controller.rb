class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
    @category_images = {}
    @categories.each do |category|
      @category_images[category] = category.images.first if category.images.size > 0
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
