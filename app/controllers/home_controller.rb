class HomeController < ApplicationController

     def index
          @spotlight = Submission.show_spotlight
          @albums = Submission.show("Album")
          @books = Submission.show("Book")
          @movies = Submission.show("Movie")
     end

     def albums
          @albums = Submission.show_all("Album")
     end

     def books
          @books = Submission.show_all("Book")
     end

     def movies
          @movies = Submission.show_all("Movie")
     end

end
