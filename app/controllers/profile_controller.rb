class ProfileController < ApplicationController
  def index
    if user_signed_in?
      category_creat = Creator.where(user_id: current_user.id)
      folow_category = Subscriber.where(user_id: current_user.id)
      get_vales(category_creat, folow_category)
    else
      redirect_to new_user_session_path
    end
  end

  private

  def get_vales(category_creat, folow_category)
    @subscribed_category = []
    @created_category = []
    folow_category.each do |category|
      category = Category.find(category.category_id)
      image =  category.images.first.image if !category.images.empty?
      @subscribed_category << { category: category, image: image }
    end
    category_creat.each do |category|
      category = Category.find(category.category_id)
      image =  category.images.first.image if !category.images.empty?
      image_count = category.posts_count
      @created_category << { category: category, image: image, img_count: image_count }
    end
  end
end
