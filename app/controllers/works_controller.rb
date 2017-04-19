class WorksController < ApplicationController

  before_action :require_login, except [:index]


  def index
    @works = Work.all

    @username = User.find(session[:user_id]).name

    @user_id = session[:user_id]
  end


  def show
      @work = Work.find(params[:id])


  end


  def new
    @work = Work.new
  end


  def edit
    @work = Work.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end


  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end


  def update

    work = Work.find(params[:id])
        data = work_params
        puts data.to_hash
        work.update!(work_params)
        result = work.save
        puts result

        redirect_to work_path(params[:id])
  end





  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_work
      @work = Work.find(params[:id])
    end

    def work_params
      params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
    end






end
