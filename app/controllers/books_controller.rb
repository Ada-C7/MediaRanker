class BooksController < ApplicationController
    def index
        @books = Work.where(category: 'book')
    end

    def new
        @book = Work.new
    end

    def create
        @book = Work.new book_params
        @book.category = 'book'
        @book.save
    end

    private
    def book_params
        params.require(:work).permit(:title, :creator, :publication_year, :description)
    end
end
