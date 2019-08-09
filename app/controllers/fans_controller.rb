class FansController < ApplicationController
  before_action :find_image
  skip_before_action :verify_authenticity_token

  def create
      UserAction.new( :user_id=>current_user.id, 
                      :action=>'likes', 
                      :action_path=>request.original_url).save
    @image.fans.create(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    UserAction.new( :user_id=>current_user.id, 
                    :action=>'unlikes', 
                    :action_path=>request.original_url).save
    @fan = @image.fans.where( user_id: current_user.id, 
                              image_id: params[:image_id])
    @fan.destroy_all()
    redirect_back(fallback_location: root_path)
  end

  private
  
  def already_faned?
    Fan.where(user_id: current_user.id, image_id:
    params[:image_id]).exists?
  end

  def find_image
    @image = Image.find(params[:image_id])
  end

end
