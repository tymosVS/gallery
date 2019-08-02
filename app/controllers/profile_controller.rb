class ProfileController < ApplicationController
  def index
    if user_signed_in?
      category_creat = Creator.where(user_id: current_user.id) 
      folow_category = Subscriber.where(user_id: current_user.id)
      
      @subscribed_category = []
      @created_category = []
      folow_category.each do |category|
        @subscribed_category << Category.find(category.category_id)
      end
      category_creat.each do |category|
        @created_category << Category.find(category.category_id)
      end
    end
  end
end
