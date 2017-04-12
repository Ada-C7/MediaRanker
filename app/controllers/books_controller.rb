class BooksController < ApplicationController
  def index
    @works = Work.where(category: "book")
  end
end
