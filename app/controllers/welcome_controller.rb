class WelcomeController < ApplicationController


  def index
      @books = Work.where(:category => "book")
      @movies = Work.where(:category => "album")
      @albums = Work.where(:category => "movie")

     
  end

end
