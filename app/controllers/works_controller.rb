class WorksController < ApplicationController
  def index
    @works = Work.all.sort {|d1, d2|  d2.votes.count <=> d1.votes.count}
  end

  def show
    @work=Work.find(params[:id])
  end

  def show_category
    @categorized_works = []
    @works = Work.all
    @works.each do |work|
      if work.category == params[:category].singularize
        @categorized_works << work
      end
    end
    return @categorized_works
  end

  #
  # def categories_list(works)
  #   works.each do | work |
  #     @categories_list << work.category
  #     @categories_list = @categories_list.uniq
  #   end
  #   return @categories_list
  # end
  def new
    @work = Work.new
  end

  def edit
    @work=Work.find(params[:id])
    params[:category] = @work.category
  end

  def update
    @work = Work.find(params[:id])
    @work.title = work_params[:title]
    @work.created_by = work_params[:created_by]
    @work.year_published = work_params[:year_published]
    @work.description = work_params[:description]
    if @work.update(work_params)
      redirect_to work_path(@work.id)
    else
      render "edit"
    end
  end

  def upvote
    if !session[:user_id]
      flash[:error] = "You must log in to do that"
      redirect_to :back
    elsif Vote.where(user_id: session[:user_id]).where(work_id: params[:id]) == []
      work = Work.find(params[:id])
      vote = Vote.create
      vote.work_id = work.id
      vote.user_id = session[:user_id]
      vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to :back
    else
      flash[:error] = "Could not upvote"
      redirect_to :back
    end
  end






  def create
    @work = Work.create work_params
    unless @work.id == nil
      redirect_to category_path(@work.category.pluralize)
    else
      render "new"
    end
  end

  def destroy
    work = Work.find(params[:id])
    category= work.category.pluralize
    Work.destroy(params[:id])

    redirect_to category_path(category)
  end


  private

  def work_params
    params.require(:work).permit(:id, :title, :created_by, :year_published, :description, :category)
  end

end
