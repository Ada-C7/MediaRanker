class WorksController < ApplicationController
  def index
    @work_category = params[:work_category]
    category = @work_category.chomp!('s')
    @works = Work.where(category: category)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    if @work.id != nil
      flash[:success] = "#{@work.category.capitalize} added successfully"
      redirect_to list_works_path(@work.category + "s")
    else
      flash.now[:error] = "#{@work.category.capitalize} not added.  Try again."
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def vote
    if session[:user_id]
      new_vote = Vote.create!(user_id: session[:user_id], work_id: params[:id])
        if new_vote
          flash[:voted] = "Successfully Upvoted!"
          redirect_to work_path(params[:id])
        end
    else
      flash[:error] = "You must login to vote!"
      redirect_to :back
    end
  end
  # user_book = UserBook.create(user_id: session[:user_id], book_id: params[:id])
  #
  # if user_book
  #   flash[:success] = "Book Bought!"
  #   redirect_to user_path(session[:user_id])
  # end

  private
  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end

end
