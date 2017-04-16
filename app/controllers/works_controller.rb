class WorksController < ApplicationController
  def show
    user_name
    @result_work = Work.find_by_id(params[:id])
    if !@result_work
      render_404
    end
  end

  def edit
    user_name
    @work = Work.find_by_id(params[:id])
  end

  def update
    user_name
    @work = Work.find_by_id(params[:id])
    if @work.update(work_params)
      flash[:success] = "Successfully updated #{@work.category} #{ @work.id }"
      if @work.category == "movie"
        redirect_to movies_path
      elsif @work.category == "book"
        redirect_to books_path
      else
        redirect_to albums_path
      end
    else
      flash.now[:failure] = "A problem occurred: Could not update #{ @work.category }"
      render "edit"
    end

  end

  def create
    user_name
    @work = Work.create(work_params)
    if @work.id != nil
      flash[:success] = "#{ @work.category } added successfully"
      if @work.category == "movie"
        redirect_to movies_path
      elsif @work.category == "book"
        redirect_to books_path
      else
        redirect_to albums_path
      end
    else
      flash.now[:failure] = "A problem occurred: Could not create #{ @work.category }"
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
    user_name
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
