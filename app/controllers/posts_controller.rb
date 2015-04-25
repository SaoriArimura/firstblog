class PostsController < ApplicationController


#before_action :signed_in_user, except:[:index]

def index
   @posts = Post.all
end

def show
  @post = Post.find(params[:id])
  @amazon = Amazon::Ecs.item_lookup(@post.item.book_id, :response_group => 'Medium')
  @replies = @post.replies.all
  @reply = Reply.new
end

def create
  @post = current_user.posts.new(post_params)
  if @post.save
    redirect_to posts_path
  end
end

def destroy
end
private

def post_params
  params.require(:post).permit(:item_id, :review)
end


end

