class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def movies
    @movies = find_movies
  end

  def books
    @books = find_books
  end

  def albums
    @albums = find_albums
  end

  def new_movie
    @work = Work.new
    @work.category = "movie"
    render "works/movies/new"
  end

  def new_book
    @work = Work.new
    @work.category = "book"
    render "works/books/new"
  end

  def new_album
    @work = Work.new
    @work.category = "album"
    render "works/albums/new"
  end

  def create
    @work = Work.new(works_params)

    if @work.save # is true - IE validations pass
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to find_path(@work)
    else # We know the validations didn't pass so want to show messages
      flash.now[:failure] = "A problem occured: Could not add #{@work.category}"
      if @work.category == "movie"
        render "works/movies/new", status: :bad_request
      elsif @work.category == "book"
        render "works/books/new", status: :bad_request
      elsif @work.category == "album"
        render "works/albums/new", status: :bad_request
      end
    end
  end

  def show
    @work = find_work
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work = find_work
    if @work.nil?
      head :not_found
    end
  end

  def update
    @work = find_work
    return head :not_found if @work.nil?

    if @work.update_attributes(works_params)
      flash[:successful_edit] = "Updated #{@work.title}"
      redirect_to work_path(@work.id)
    else
      flash.now[:failure_update] = "A problem occured: Could not update #{@work.category}"
      if @work.category == "movie"
        render :edit, status: :bad_request
      elsif @work.category == "book"
        render :edit, status: :bad_request
      elsif @work.category == "album"
        render :edit, status: :bad_request
      end
    end
  end

  def destroy
    work = find_work
    if work.nil?
      head :not_found
    else
      path = find_path(work)
      work.destroy
      flash[:success] = "#{work.title} was deleted"
      redirect_to path
    end
  end

  def vote
    vote = Vote.create(user_id: session[:user_id], work_id: params[:id])

    if vote
      flash[:successful_vote] = "Successfully Voted"
      redirect_to work_path(params[:id])
    else
      flash[:vote_failure] = "You have already voted for this"
      redirect_to work_path(params[:id])
    end
  end

private
  def works_params
    return params.required(:work).permit(:category,
                                         :title,
                                         :creator,
                                         :publication_year,
                                         :description)
  end

  def find_work
    Work.find_by(id: params[:id])
  end

  def find_movies
    Work.all.where(category: "movie")
  end

  def find_books
    Work.all.where(category: "book")
  end

  def find_albums
    Work.all.where(category: "album")
  end

  def find_path(work)
    if work.category == "movie"
      return movies_path
    elsif work.category == "book"
      return books_path
    elsif work.category == "album"
      return albums_path
    end
  end

end
