class SubscribersController < ApplicationController


  def create
    @category = Category.find(params[:category_id])
    @user = User.find(current_user.id)
    @category.subscribers.create(category_id: @category, user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end
end
