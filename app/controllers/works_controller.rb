class WorksController < ApplicationController
    def index
        work_category = request.path
        @works = Work.where(category: work_category[1..-2])
    end

    def new
        @work = Work.new
    end

    def create
        new
        if @work.update(work_params)
            flash[:success] = "#{@work.title} added successfully"
            redirect_to send("#{@work.category}s_path")
        else
            flash.now[:failure] = 'Media was not created'
            render :new, status: :bad_request
        end
    end

    def update
        edit
        if @work.nil?
            head :not_found
        else
            if @work.update(work_params)
                flash[:success] = "#{@work.title} updated successfully"
                redirect_to work_path(@work)
            else
                flash.now[:failure] = 'Media was not updated'
                render 'edit', status: :bad_request
            end
      end
    end

    def edit
        @work = Work.find_by(id: params[:id])
        head :not_found if @work.nil?
    end

    def show
        @work = Work.find_by(id: params[:id])
        head :not_found if @work.nil?
    end

    def destroy
        work = Work.find_by(id: params[:id])
        if work.nil?
            head :not_found
        else
            work.destroy
            redirect_to home_path
        end
    end

    def upvote
        @work = Work.find_by(id: params[:id])
        already_voted = @work.votes.select { |vote| vote[:user_id] == session[:user_id] }

        if session[:user_id] && already_voted.empty?
            Vote.create(user_id: session[:user_id], work_id: @work.id)
            flash[:success] = "Successfully voted for #{@work.title}"
        elsif session[:user_id] && !already_voted.empty?
            already_voted[0].destroy
            flash[:unvote] = 'Vote Recanted'
        else
            flash[:failure] = 'Must be loged in to vote'
        end
        redirect_to :back
    end
    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def work_params
        params.require(:work).permit(:title, :category, :creator, :published_year, :description)
    end
end
