class WorksController < ApplicationController

  def show
    @work=Work.find(params[:id])
  end

  # def create
  #   work = Work.new
  #   work.category = "movie"
  #   work.user_id = session[:user_id]
  #   work.title = work_params[:title]
  #   work.publication_year = work_params[:publication_year]
  #   work.description = work_params[:description]
  #
  #   work.save!
  #   redirect_to movies_path
  # end

  #
  # def edit
  #   @work=Work.find(params[:id])
  # end

  def update
    @work=Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path
    end
  end

  # def destroy
  #   Work.destroy(params[:id])
  #   redirect_to works_path
  # end

  private

  def work_params
    return params.require(:work).permit(:title, :publication_year, :description)
  end
end
