class BooksController < WorksController
  def index
    @books = Work.where(category: "book")
  end

  def new
    super
    @path = books_path
  end

  def create
    super("book")
  end
end
