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

        if @book.id
            flash[:success] = "You have successfully added the book #{@book.title}"
            redirect_to books_path
        else
            flash[:error] = "Try again, your book was not added"
            redirect_to new_book_path
        end
    end

    private
    def book_params
        params.require(:work).permit(:title, :creator, :publication_year, :description)
    end
end
