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
      flash[:status] = :success
      flash[:message] = "Successfully created #{@item.category} #{@item.id}"
      redirect_to category_index_path(item_params[:category])
    else
      flash[:status] = :failure
      flash[:message] = "Could not create #{@item.category.singularize}"
      flash[:errors] = @item.errors.messages

      # flash.now[:status] = :failure
      # flash.now[:message] = "Could not create #{@item.category.singularize}"
      # flash[:errors] = @item.errors.messages
      #render :new, status: :bad_request
      redirect_to new_item_by_category_path(@item.category), status: :bad_request
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
    id = item.id
    item.destroy
    flash[:success] = "Successfully destroyed #{category} #{id}"
    redirect_to category_index_path(category)
  end

  def vote
    if session[:user_id].nil?
      flash[:failure] = "You must be logged in to vote. Please use login button at the top right."
      redirect_to item_path(params[:id])
      return
    end

    if Vote.where(user_id: session[:user_id], item_id: params[:id]).empty?
      Vote.create(user_id: session[:user_id], item_id: params[:id])
      flash[:success] = "Thanks for voting for #{Item.find(params[:id]).title}!"
    else
      flash[:failure] = "I know you love #{Item.find(params[:id]).title}, but you can only vote for it once!"
    end
    redirect_to item_path(params[:id])
  end


  private

  def item_params
    return params.require(:item).permit(:category, :title, :creator, :publication_year, :description)
  end
end
