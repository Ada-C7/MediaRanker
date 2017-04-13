class BooksController < ApplicationController
  def index
    @works = Work.where(category: "book")
  end

  def new
    @work = Work.new
    @work.category = "book"
  end
end
