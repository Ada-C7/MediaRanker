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
    if @work.save
      flash[:success] = "Book added successfully"
      redirect_to list_works_path(@work.category + "s")
    else
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def vote
    @user = User.find(params[:id])
    new_vote = Vote.create(user_id: @user.id, work_id: params[:id])
    if new_vote
      flash[:voted] = "Successfully Upvoted!"
      redirect_to work_path(params[:id])
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
