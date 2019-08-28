# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  respond_to :html, :js

  def new
    @category = Category.new
  end

  def index
    @categories = Category.where.not(title: "Non_categorizated", 
                                    description: 'Images no category').order(:title).page params[:page]
    @category_images = {}
    @category_owners = {}
    @pre_sub = {}
    @categories.each do |category|
      @pre_sub[category] = category.subscribers.find { |fan| fan.user_id == current_user.id} if user_signed_in?
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
    skip_before_filter :verify_authenticity_token, if: :json_request?
    respond_to do |format|
      format.html
      format.json{
          render :json => Category.new(:title => params[:title], :description => params[:description]).save
      }

    end
  
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @category.destroy
  
    redirect_back(fallback_location: root_path)
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
