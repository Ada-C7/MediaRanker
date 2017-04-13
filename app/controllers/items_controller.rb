class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def index_by_category
    @items_of_category = Item.by_category(params[:category].singularize)
  end

  def new
    @item = Item.new(category:params[:category].singularize)
  end


  def create

    @item= Item.new(item_params)
    @item.save
    # if @passenger.save
    #   redirect_to passengers_path
    # else
    #   render :new
    # end
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private

  def item_params
    return params.require(:item).permit(:category, :title, :creator, :publication_year, :description)
  end
end
