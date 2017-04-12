class HomeController < ApplicationController

     def index
          @spotlight = Submission.show_spotlight
          @albums = Submission.show_albums
          @books = Submission.show_books
          @movies = Submission.show_movie
     end

end
