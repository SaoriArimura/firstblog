class PostsController < ApplicationController

  before_action :authenticate_user!, except:[:index]
  before_action :set_post, except:[:new,:index,:create]
  def new
    @img = params[:imgURL]
    @title = params[:title]
    @itemid = params[:id]
    @categories = Category.all
    @post = Post.new
    @daimei = "投稿する"
  end

  def index
    @posts = Post.page(params[:page])
  end


  def show
    @replies = @post.replies.all
    @reply = Reply.new
  end

 
  def create
    @post = @current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: '作成されました'
    else
      render 'new', notice:'作成できませんでした'
    end
  end

  def edit
    if @current_user.id != @post.user.id
      redirect_to post_path(@post) ,alert:'編集できません'
    else
      @img = @post.item.imgURL
      @title = @post.item.title
      @itemid = @post.item_id
      @categories = Category.all
      @daimei = "投稿を編集する"
    end
  end

  def update
    if @current_user.id != @post.user.id
      redirect_to post_path(@post),alert:'編集できません'
    else
      if @post.update(post_params)
        redirect_to post_path(@post), notice:'更新されました'
      else
        render action: 'edit', notice:'編集できませんでした'
      end
    end
  end

  def destroy
  if @current_user.id != @post.user.id
    redirect_to post_path(@post), alert:'削除できません'
  else
    @post.destroy
    redirect_to posts_path, notice:'削除しました'
  end
  end

  private

  def post_params
    params.require(:post).permit(:review, :item_id, :category_tag_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end


end

