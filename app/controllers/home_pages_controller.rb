class HomePagesController < ApplicationController
  def index
    @images = {}
    @top_categories.each do |top_cat|
      @images[top_cat] = top_cat.images.first
    end
  end
end
