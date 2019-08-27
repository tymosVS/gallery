class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @category = Category.find(params[:category_id])
    @image = Image.new(image_params)
    if @image.save
      @category.posts.create(category: @category, image: @image)
      redirect_to category_posts_path(@category)
    else
      render :new
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts.order("created_at DESC").page(params[:page])
    @images = Image.order(:title).page params[:page]
    @images = {}  
    @posts.each do |post|
      if post
        @images[post] = post.image
      end
    end
  end

  def show
    @category = Category.friendly.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    @image = @post.image
  end

  def destroy
    @category =Category.friendly.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    @post.destroy
    redirect_to category_posts_path
  end

  private 

  def image_params
    params.require(:image).permit(:title, :image)
  end
end
