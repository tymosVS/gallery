module SubscribersHelper
  def already_subscribed?
    Subscriber.where(category_id: @category, user_id: current_user.id).exists?
  end

  def pre_sub
    pre_sub = Subscriber.where(category_id: @category, user_id: current_user.id).first
    # pre_sub = @category.subscribers.find { |fan| fan.user_id == current_user.id} 
  end
end
