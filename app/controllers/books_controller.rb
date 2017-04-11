class BooksController < ApplicationController
  def index
    @books = Work.all.select {|work| work.category == "book"}
  end
end
