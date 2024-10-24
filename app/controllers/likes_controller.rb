class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      respond_to do |format|
        format.html { redirect_to posts_index_path }
        format.turbo_stream
      end
    else
      redirect_to posts_index_path, alert: @like.errors.full_messages 
    end
  end

  def destroy
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
