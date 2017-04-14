class WorksController < ApplicationController
  def index
    @work_category = params[:work_category]
    category = @work_category.chomp!('s')
    @works = Work.where(category: category)
    @works = @works.sort_by{|work| work.votes.count}.reverse

  end

  def new
    @work_category = params[:work_category]
    @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    if @work.id != nil
      flash[:success] = "#{@work.category} added successfully"
      redirect_to list_works_path(@work.category + "s")
    else
      flash.now[:error] = "#{@work.category} not added.  Try again."
      render :new, status: :bad_request
    end
  end

  def show
    @work_category = params[:work_category]
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      # render status: :not_found, nothing: true
      head :not_found
    end
  end


  def vote
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      puts "look here"
      puts user.votes.where(work_id: params[:id]).count
      if user.votes.where(work_id: params[:id]).count < 1
        new_vote = Vote.create!(user_id: session[:user_id], work_id: params[:id])
          if new_vote
            flash[:voted] = "Successfully Upvoted!"
            redirect_to work_path(params[:id])
          end
      else
        flash[:error] = "You've already voted!"
        redirect_to :back
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
