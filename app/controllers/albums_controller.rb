class AlbumsController < ApplicationController
  def index
    @albums = Work.all.select {|work| work.category == "album"}
  end
end
