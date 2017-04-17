class WorksController < ApplicationController

  def index
    @books = books[0..9]
    @albums = albums[0..9]
    @movies = movies[0..9]

  end

 def books
   works = Work.where(category: "book")
   @works = works.sort {|b1, b2| b2.votes.count <=> b1.votes.count}
   return @works
 end

 def albums
   works = Work.where(category: "album")
   @works = works.sort {|a1, a2| a2.votes.count <=> a1.votes.count}
   return @works
 end

def movies
   works = Work.where(category: "movie")
   @works = works.sort {|m1, m2| m2.votes.count <=> m1.votes.count}
   return @works
end


  def show
    @work = Work.find_by(id: params[:id])
    if !@work
      render_404
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    if work.update(work_params)
      redirect_to works_path
    else
      render "edit"
    end
  end

  def new
    @work = Work.new
    @category = params[:category].singularize
  end

  def create
    @work = Work.create work_params
    
    unless @work.id == nil
      redirect_to works_path
    else
      render "new"
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private
  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end

end
