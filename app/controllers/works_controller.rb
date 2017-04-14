class WorksController < ApplicationController
    def index
        @works = Work.all
        @books = Work.where(category: 'book')
        @movies = Work.where(category: 'movie')
        @albums = Work.where(category: 'album')
    end

    def show
        @result_work = Work.find_by_id(params[:id])
    end

    def edit
         @work = Work.find(params[:id])
    end

    def destroy
        @work = Work.find(params[:id]).delete
         unless !@work.id
            flash[:success] = "You've deleted that work"
            redirect_to works_path
        end


    end

end
