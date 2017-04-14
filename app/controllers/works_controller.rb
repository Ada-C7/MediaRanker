class WorksController < ApplicationController
  def show
    @result_work = Work.find_by_id(params[:id])
    if !@result_work
      render_404
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
  end

  def update
    @work = Work.find_by_id(params[:id])
    if @work.update(work_params)
      if @work.category == "movie"
        redirect_to movies_path
      elsif @work.category == "book"
        redirect_to books_path
      else
        redirect_to albums_path
      end
    else
      render "edit"
    end
  end

  def create
    @work = Work.create(work_params)
    if @work.id != nil
      flash[:success] = "#{@work.category} added successfully"
      if @work.category == "movie"
        redirect_to movies_path
      elsif @work.category == "book"
        redirect_to books_path
      else
        redirect_to albums_path
      end
    else
      flash.now[:error] = "Error has occured"
      if @work.category == "movie"
        render "movies/new"
      elsif @work.category == "book"
        render "books/new"
      else
        render "albums/new"
      end
    end
  end

  def destroy
    work = Work.find_by_id(params[:id])
    category = work.category
    Work.destroy(params[:id])

    if category == "movie"
      redirect_to movies_path
    elsif category == "book"
      redirect_to books_path
    else
      redirect_to albums_path
    end
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
  end
end
