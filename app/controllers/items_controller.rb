class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def index_by_category
    @items_of_category = Item.by_category(params[:category].singularize)
  end

  def new
    @item = Item.new(category:params[:category])
  end


  def create

    @item= Item.new(item_params)
    @item.save
    if @item.save
      redirect_to category_index_path(item_params[:category])
    else
      render :new
    end
  end

   def show
     @item = Item.find(params[:id])
   end

   def edit
     @item = Item.find(params[:id])
   end

   def update
     item = Item.find(params[:id])
     item.update(item_params)
     redirect_to category_index_path(item.category)
   end


   def destroy
     item = Item.find(params[:id])
     category= item.category
     item.destroy
     redirect_to category_index_path(category)
   end



  private

  def item_params
    return params.require(:item).permit(:category, :title, :creator, :publication_year, :description)
  end
end
