class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.publication_year = work_params[:publication_year]
    @work.description = work_params[:description]

    if @work.save
      flash[:updated] = "Book updated successfully"
      redirect_to work_path(@work.id)
    else
      render "edit"
    end
  end

  def destroy
    @work = Work.find(params[:id])
    Work.destroy(params[:id])

    if @work.category == 'movie'
      flash[:delete] = "Successfully destroyed movie #{@work.id}"
      redirect_to movies_path
    elsif @work.category == 'book'
      flash[:delete] = "Successfully destroyed book #{@work.id}"
      redirect_to books_path
    else
      flash[:delete] = "Successfully destroyed album #{@work.id}"
      redirect_to albums_path
    end
  end

  private
  def work_params
    media_params # In ApplicationController :)
  end
end
