class ItemsController < ApplicationController

  def index
    @keyword = params[:keyword]
    if @keyword.present?
      Amazon::Ecs.debug = true
      @book_id = Amazon::Ecs.item_search(params[:keyword],
                                         :search_index => 'Books', :response_group => 'Medium')
    else
      return
    end
  end

  def create
    item = params.require(:item).permit(:book_id)
    @item = Item.new(item)
    unless Item.where(item).exists? then 
    @item.save 
    end
    @amazon = Amazon::Ecs.item_lookup(@item.book_id, :response_group => 'Medium')
    @itemid = Item.where(:book_id => @item.book_id).pluck(:id)
    @post = Post.new
        render :template => 'posts/new'
end
end
