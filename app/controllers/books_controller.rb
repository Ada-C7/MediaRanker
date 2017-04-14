class BooksController < WorksController
  def index
    @books = Work.where(category:"book")
  end

  def new
    @work = Work.new(category: "book")
  end
end
