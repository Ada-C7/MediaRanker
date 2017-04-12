class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
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

    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
