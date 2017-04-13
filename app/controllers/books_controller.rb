class BooksController < WorksController
  def index
    @books = Work.where(category:"book")
  end

end
