class SubscribersController < ApplicationController
  before_action :find_components
  skip_before_action :verify_authenticity_token

  def create
    if helpers.already_subscribed?
      @subscriber = Subscriber.where(category_id: @category, user_id: current_user.id)
      @subscriber.destroy_all()
    else
      @category.subscribers.create(category_id: @category, user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @subscriber = Subscriber.where(category_id: @category, user_id: current_user.id)
    @subscriber.destroy_all()
  end

  private

  def find_components
    @category = Category.find(params[:category_id])
    @user = User.find(current_user.id)
  end
end
