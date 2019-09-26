class HomePagesController < ApplicationController
  def index
    @images = {}
    @top_categories.each do |top_cat|
      @images[top_cat] = top_cat.images.first(3)
    end
    @statistic = [Image.count, Fan.count, Comment.count]
  end
end
