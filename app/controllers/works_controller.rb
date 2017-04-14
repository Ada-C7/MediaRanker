class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @works = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      # We know the validations didn't pass
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to work_path(user)
  end

  def destroy
    user = Work.find(params[:id])
    user.destroy

    redirect_to users_path

    # Another valid but perhaps less clean option for reloading the list of users
    # @users = Work.all
    # render :index
  end

  # def mark_read
  #   puts ">>> DPR: Marking a user as read!"
  # end

private
  def user_params
    return params.require(:user).permit(:name)
  end
end
