class BooksController < WorksController
  def index
    user_name
    @books = Work.where(category:"book").order(votes_count: :desc)
  end

  def new
    user_name
    @work = Work.new(category: "book")
  end
end
