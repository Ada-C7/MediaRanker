class AlbumsController < ApplicationController
  def index
    @albums = Work.albums
  end

  def new
    @album = Work.new
  end

  def create
    if session[:user_id].nil?
      return redirect_to login_path
    end
    @album = Work.new
    @album.category = "album"
    @album.user_id = session[:user_id]
    @album.title = work_params[:title]
    @album.publication_year = work_params[:publication_year]
    @album.description = work_params[:description]

    if @album.valid?
      @album.save!
      redirect_to albums_path
    else
      flash.now[:alert] = "Album is not added!"
      render "new", status: :bad_request
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :publication_year, :description)
  end
end
