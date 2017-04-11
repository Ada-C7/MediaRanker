class AlbumsController < ApplicationController
  def index
    @albums = []
    Work.all.each do |w|
      if w.category == "album"
        @albums << w
      end
    end
  end
end
