module FansHelper
  def pre_like
    pre_like = @image.fans.find { |fan| fan.user_id == current_user.id} 
  end
end
