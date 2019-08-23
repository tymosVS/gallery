# frozen_string_literal: true

module FansHelper
  def pre_like
    @image.fans.find { |fan| fan.user_id == current_user.id } 
  end
end
