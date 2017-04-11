class WorksController < ApplicationController
    def index
        @works = Work.where(category: params[:format])
    end

    def new
        @work = Work.new
    end

    def create
        new
        if @work.update(work_params)
            redirect_to works_path
        else
            render 'new'
        end
    end

    def update
        edit
        if @work.update(work_params)
            redirect_to work_path(@work)
        else
            render 'edit'
        end
    end

    def edit
        @user = Work.find(params[:id])
    end

    def show
        @work = Work.find(params[:id])
    end

    def destroy
        work = Work.find(params[:id])
        work.destroy
        redirect_to works_path
    end
    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def work_params
        params.require(:work).permit(:title, :type, :creator, :published_year, :description)
    end
end
