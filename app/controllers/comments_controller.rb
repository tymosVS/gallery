class CommentsController < ApplicationController
  after_action :trak_action, only: :create

  def index
    @comments = Comment.all.order(:created_at).reverse_order.page params[:page]
  end

  def create
    return unless user_signed_in?

    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def trak_action
    UserAction.new(user_id: current_user.id, action: 'comments', action_path: request.original_url).save
  end
end
