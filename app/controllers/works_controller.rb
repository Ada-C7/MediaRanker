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
end
