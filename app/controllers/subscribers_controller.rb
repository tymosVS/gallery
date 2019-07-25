class SubscribersController < ApplicationController
  before_action :find_components
  skip_before_action :verify_authenticity_token

  def create
    if already_subscribed?
      @subscriber = Subscriber.where(category_id: @category, user_id: current_user.id)
      @subscriber.destroy_all()
    else
      @category.subscribers.create(category_id: @category, user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  private
  
  def already_subscribed?
    Subscriber.where(category_id: @category, user_id: current_user.id).exists?
  end

  def find_components
    @category = Category.find(params[:category_id])
    @user = User.find(current_user.id)
  end
end
