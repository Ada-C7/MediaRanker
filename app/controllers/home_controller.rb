class HomeController < ApplicationController
    def index
        @albums = Work.where(category: 'album')
        @books = Work.where(category: 'book')
        @movies = Work.where(category: 'movie')
        @spotlight = Work.all.max_by { |w| w.votes.count }
    end
end
