class AlbumsController < ApplicationController
  def index
    @albums = Work.all.select {|work| work.category == "album"}
  end

  def new
    @album = Work.new
  end

  def create
    @album = Work.create work_params
    @album.category = "album"
    @album.save

    unless @album.id == nil
      flash[:success] = "#{@album.title} added!"
      redirect_to albums_path
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year, :category)
  end
end
