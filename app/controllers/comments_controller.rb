class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(:created_at).reverse_order
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :body)
    end
end
