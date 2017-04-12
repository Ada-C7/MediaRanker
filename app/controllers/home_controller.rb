class HomeController < ApplicationController

     def index
          @spotlight = Submission.show_spotlight
          @albums = Submission.show("Album")
          @books = Submission.show("Book")
          @movies = Submission.show("Movie")
     end

     def albums
          @albums = Submission.where("category = ?", "Album" )
     end

     def books
          @books = Submission.where("category = ?", "Book" )
     end

     def movies
          @movies = Submission.where("category = ?", "Movie" )
     end

end
