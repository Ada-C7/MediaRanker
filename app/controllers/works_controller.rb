class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    # using save! or create! bang will give a rails error message and tell you what validation failed
    @work = Work.create(work_params)
    if @work.id != nil
      flash[:success] = "Successfully created #{@work.category} #{@work_id}"
      redirect_to works_path
    else
      render :new, status: :bad_request
    end
  end

#this was the create method I had earlier.  Leaving it in case I can go back and work on this because create gets errors in testing
  # def create
  #   # using save! or create! bang will give a rails error message and tell you what validation failed
  #   @work = Work.create(work_params)
  #   if @work.save
  #     redirect_to works_path
  #   else
  #     render :new
  #   end
  # end

  def show
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    else
      @work.update_attributes(work_params)
      if @work.save
        redirect_to work_path(@work)
      else
        render :edit, status: :bad_request
      end
    end
  end

  def destroy
    work = Work.find_by(id: params[:id])
    if work.nil?
      head :not_found
    else
      work.destroy
      redirect_to works_path
    end
  end

#ran out of time to write this
  def upvote
    #if vote exists destroy vote?
    #else Vote.create
  end

  def movies
    @works = Work.gather_movies
    render "movies"
  end

  def books
    @works = Work.gather_books
    render "books"
  end

  def albums
    @works = Work.gather_albums
    render "albums"
  end

  def spotlight
    @works.find_spotlight
  end

  private

  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description)
  end
end
