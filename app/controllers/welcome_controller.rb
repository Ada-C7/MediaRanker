class WelcomeController < ApplicationController


  def index
      @books = Work.where(:category => "book")
      @movies = Work.where(:category => "album")
      @albums = Work.where(:category => "movie")
    # @books = Work.find_by_category("book")
  end
  
end
