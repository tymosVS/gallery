class FansController < ApplicationController
  before_action :find_image
  skip_before_action :verify_authenticity_token
  respond_to :html, :js

  def create
    trackind('likes')
    @image.fans.create(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    trackind('unlikes')
    @fan = @image.fans.where( user_id: current_user.id, 
                              image_id: params[:image_id])
    @fan.destroy_all()
    redirect_back(fallback_location: root_path)
  end

  private
  def trackind(type_action) 
    action_path = request.original_url[0...request.original_url.index('/fans')]
    UserAction.new( :user_id=>current_user.id, 
      :action=>type_action, 
      :action_path=>action_path).save
  end

  def already_faned?
    Fan.where(user_id: current_user.id, image_id:
    params[:image_id]).exists?
  end

  def find_image
    @image = Image.find(params[:image_id])
  end

end
