class RepliesController < ApplicationController
  
  before_action :authenticate_user!
 
  def create
    @reply = @current_user.replies.build(post_params)
    if @reply.save
      redirect_to post_path(@reply.post), notice: '投稿が完了しました'
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    if @current_user.id != @reply.user.id
      redirect_to post_path(@reply.post), alert:'削除できません'
    else
      @reply = Reply.find(params[:id])
      @reply.destroy
      redirect_to post_path(@reply.post), notice:'投稿を削除しました'
    end
  end

  private
  def post_params
    params.require(:reply).permit(:post_id, :context)
  end

end
