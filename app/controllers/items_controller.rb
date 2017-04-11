class ItemsController < ApplicationController

  def index
    @items = Item.all
    @albums = Item.where(category: "album")
    @movies = Item.where(category: "movie")
    @books = Item.where(category: "book")
  end

  def albums
    @albums = Item.where(category: "album")
  end

  def books
    @books = Item.where(category: "book")
  end

  def movies
    @movies = Item.where(category: "movie")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
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
    return params.require(:item).permit(:category, :title, :created_by, :published, :description)
  end

end
