class SubscribersController < ApplicationController
  before_action :find_components
  skip_before_action :verify_authenticity_token

  def create
    @category.subscribers.create(category_id: @category, user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @subscriber = Subscriber.where(category_id: @category, user_id: current_user.id)
    @subscriber.destroy_all()
    redirect_back(fallback_location: root_path)
  end

  private

  def find_components
    @category = Category.find(params[:category_id])
    @user = User.find(current_user.id)
    @pre_sub = @category.subscribers.find { |fan| fan.user_id == current_user.id}
  end
end
