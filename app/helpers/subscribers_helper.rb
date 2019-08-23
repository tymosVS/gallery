# frozen_string_literal: true

module SubscribersHelper
  def already_subscribed?
    Subscriber.where(category_id: @category, user_id: current_user.id).exists?
  end
end
