class AlbumsController < ApplicationController
    def index
        @albums = Work.where(category: 'album')
    end

    def new
        @album = Work.new
    end

    def create
        @album = Work.new album_params
        @album.category = 'album'
        @album.save
        if @album.id
            flash[:success] = "You have successfully added the book #{@album.title}"
            redirect_to albums_path
        else
            flash[:error] = "Try again, your book was not added"
            redirect_to new_album_path
        end
    end

    private
    def album_params
        params.require(:work).permit(:title, :creator, :publication_year, :description)
    end

end
