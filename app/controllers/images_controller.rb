class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update]

  def index
    # @images = Image.order('created_at DESC')
    @images = Image.order(:title).page params[:page]
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update_attributes(image_params)
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def image_params
    params.require(:image).permit(:title, :image)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
