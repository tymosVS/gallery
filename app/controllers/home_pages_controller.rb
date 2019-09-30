class HomePagesController < ApplicationController
  def index
    @images = {}
    if @top_categories
      @top_categories.each do |top_cat|
        if top_cat.images.count > 3
          @images[top_cat] = top_cat.images.first(3)
        end
      end
    end
    @statistic = [Image.count, Fan.count, Comment.count]
  end
end
