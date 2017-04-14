class WorksController < ApplicationController
  def index
    # @works = Work.all
    super
    # @movies = Work.all.select {|work| work.category == "movie"}

    # @books = Work.all.select {|work| work.category == "book"}
    # @books.order(title: :desc)

    # @albums = Work.all.select {|work| work.category == "album"}
  end

  def show
    @result_work = Work.find(params[:id])
    @work_votes = Vote.where(work_id: params[:id])
  end

  def destroy
    work = Work.find(params[:id])
    category = work.category
    Work.destroy(params[:id])

    if category == "book"
      flash[:success] = "Successfully deleted book #{work.id}"
      redirect_to books_path
    elsif category == "album"
      flash[:success] = "Successfully deleted album #{work.id}"
      redirect_to albums_path
    elsif category == "movie"
      flash[:success] = "Successfully deleted movie #{work.id}"
      redirect_to movies_path
    else
      flash.now[:error] = "A problem occurred: Could not delete #{work.category}"
      render "show"
    end
  end

  def upvote
    @result_work = Work.find(params[:id])
    # @result_work = Work.find(shoe)

    work_votes = Vote.where(user_id: session[:user_id])

    already_voted = work_votes.select {|work| work.work_id == @result_work.id}

    if already_voted.length > 0
      flash[:error] = "Could not upvote"
      redirect_to work_path(@result_work.id)
      return
    end

    if session[:user_id] != nil
      @result_work.vote_count += 1
      @result_work.save

      @vote = Vote.new
      @vote.user_id = session[:user_id]
      @vote.work_id = params[:id]
      @vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to :back
    else
      flash[:error] = "you must be logged in to vote"
      redirect_to :back
    end

    # if @vote.save
    #   flash[:success] = "Successfully upvoted!"
    #   redirect_to work_path(@result_work.id)
    # end

  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.description = work_params[:description]

    if @work.save
      redirect_to work_path(@work.id)
    # elsif @work.save && @work.category == "album"
    #   redirect_to albums_path
    # elsif @work.save && @work.category == "movie"
    #   redirect_to movies_path
    else
      render "edit"
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year)
  end
end
