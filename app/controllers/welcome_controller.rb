class WelcomeController < ApplicationController


  def index
      @books = Work.where(:category => "book")
      @movies = Work.where(:category => "movie")
      @albums = Work.where(:category => "album")
  end



end
