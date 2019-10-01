class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  def index
    # @images = Image.order('created_at DESC')
    @images = Image.order(:title).page params[:page]
  end

  def show
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end
end
