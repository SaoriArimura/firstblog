class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      Amazon::Ecs.debug = true
      book = Amazon::Ecs.item_search(params[:keyword], :search_index => 'Books', :response_group => 'Medium')
      @item = book.items
    else
      return
    end
  end

  def create
    @item = Item.new(item_params)
    unless Item.where(:book_id => @item.book_id).exists? then
      @item.save
    end
    @itemid = Item.find_by(:book_id => @item.book_id).id 
    redirect_to new_post_path(:imgURL => @item.imgURL, :title => @item.title, :id => @itemid)
  end

  def show
    item = Item.find(params[:id])
    @uri = item.bookURL
    @doc = Nokogiri::HTML(open(@uri),nil,"utf-8") 
  end

  private

  def item_params
    params.require(:item).permit(:book_id, :title, :author, :manufacturer, :imgURL, :bookURL, :price)
  end


end
