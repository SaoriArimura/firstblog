class RepliesController < ApplicationController

def create
  @reply = current_user.replies.build(post_params)
  if @reply.save
  redirect_to posts_url, notice: '投稿が完了しました'
  end
end


private
def post_params
  params.require(:reply).permit(:post_id, :context)
end




end
