class ItemsController < ApplicationController

  def index
    @items = Item.all
    @albums = Item.where(category: "album")
    @movies = Item.where(category: "movie")
    @books = Item.where(category: "book")
  end

  def category
    @category = params[:category]
    @items_by_category = Item.where(category: @category)
  end

  def new
    @category = params[:category]
    @item = Item.new(category: @category)
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to category_path(@item.category)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    return params.require(:item).permit(:category, :title, :creator, :publication_year, :description)
  end

end
