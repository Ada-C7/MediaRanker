class WorksController < ApplicationController
  def index
    @works = Work.all
  end


  # def show
  #   @result_work=Work.find(params[:id])
  # end
  #
  # def show_owner
  #   @works_list = Work.where(owner: params[:owner].capitalize)
  # end
  #
  #
  # def new
  #   @work = Work.new
  # end
  #
  # def create
  #   work = Work.create work_params
  #   unless work.id == nil
  #     redirect_to works_path
  #   end
  # end
  #
  # def edit
  #   @work=Work.find(params[:id])
  # end
  #
  #
  # def update
  #   @work=Work.find(params[:id])
  #   if @work.update(work_params)
  #     redirect_to works_path
  #   end
  # end
  #
  # def destroy
  #   Work.destroy(params[:id])
  #   redirect_to works_path
  # end
end
