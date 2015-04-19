class PostsController < ApplicationController


#before_action :signed_in_user, except:[:index]

def index
   @posts = Post.all
end

def show
  @post = Post.find(params[:id])
  @amazon = Amazon::Ecs.item_lookup(@post.item.book_id, :response_group => 'Medium')
end


def create
  @post = current_user.posts.build(post_params)
  if @post.save
  redirect_to posts_url, notice: '登録が完了しました'
  else
  render items_index_path
  end
  
end

def destroy
end
private

def post_params
  params.require(:post).permit(:item_id, :review)
end


end

