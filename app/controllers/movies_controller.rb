class MoviesController < ApplicationController
    def index
        @movies = Work.where(category: 'movie')
    end

    def new
        @movie = Work.new
    end

    def create
        @movie = Work.new movie_params
        @movie.category = 'movie'
        @movie.save

        if @movie.id
            flash[:success] = "You have successfully added the movie #{@movie.title}"
            redirect_to movies_path
        else
            flash[:error] = "Try again, your movie was not added"
            redirect_to new_movie_path
        end
    end 

    private
    def movie_params
        params.require(:work).permit(:title, :creator, :publication_year, :description)
    end
end
