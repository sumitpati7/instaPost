class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post_id)}
        format.turbo_stream
      end
    else
      redirect_to post_path(@comment.post_id), alert: @comment.errors.full_messages
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { post_path(@comment.post_id) }
        format.turbo_stream
      end
    else 
      redirect_to post_path(@comment.post_id), alert: @comment.errors.full_messages
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
