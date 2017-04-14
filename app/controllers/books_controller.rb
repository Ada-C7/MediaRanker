class BooksController < ApplicationController
  def index
    @books = Work.books
  end

  def show
    @result_book = Work.find(params[:id])
  end

  def edit
    @book = Work.find(params[:id])
  end

  def update
    @book = Work.find(params[:id])

    @book.title = book_params[:title]
    @book.creator = book_params[:creator]
    @book.pub_year = book_params[:pub_year]
    @book.description = book_params[:description]

    if @book.save
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to books_path
  end

  def create
    @book = Work.create book_params

    if @book.id != nil
      redirect_to books_path
    else
      render "new"
    end
  end

  def new
    @work = Work.new(:category => "book")

    render template: "works/new"
  end

  private

  def book_params
    params.require(:book).permit(:title, :creator, :pub_year, :description)
  end


end
