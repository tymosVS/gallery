class HomePagesController < ApplicationController
  def index
    @images = Image.all.limit(3)
  end
end
