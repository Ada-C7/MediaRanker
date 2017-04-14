class BooksController < ApplicationController
    def index
        @books = Work.where(category: 'book')
    end
end
