class WorksController < ApplicationController
  def index
    @works = Work.all
    @movies = Work.all.select {|work| work.category == "movie"}

    @books = Work.all.select {|work| work.category == "book"}
    # @books.order(title: :desc)

    @albums = Work.all.select {|work| work.category == "album"}
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end
end
