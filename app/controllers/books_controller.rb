class BooksController < ApplicationController
    def index
        @books = Work.where(category: 'book')
    end

    def new
        @book = Work.new
    end

    def create
        @book = Work.create book_params
    end

    private
    def book_params
        params.require(:book).permit(:title, :creator, :publication_year, :description)
    end
end
