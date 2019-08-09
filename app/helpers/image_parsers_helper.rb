module ImageParsersHelper
  def already_faned?
    Fan.where(user_id: current_user.id, image_id:
    params[:image_id]).exists?
  end
end
