class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(id: params[:id])
        head :not_found if @user.nil?
    end

    def create
        new
        if @user.update(user_params)
            redirect_to users_path
        else
            render :new, status: :bad_request
        end
    end

    def upvote
        if session[:user_id]
            Vote.new(user_id: session[:user_id], work_id: params[:id])
        else
            flash[:failure] = 'Must be loged in to vote'
            redirect_to :back
        end
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
