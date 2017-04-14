class VotesController < ApplicationController
    def upvote
        if Vote.already_created(params[:id], session[:user_id] )
            flash[:error] = "You've already voted for this"
            redirect_to root_path
        else
            vote = Vote.new
            vote[:work_id] = params[:id]
            vote[:user_id] = session[:user_id]

            if vote.save
                flash[:success] = "Thanks for voting"
                redirect_to root_path
            else
                flash[:error] = "Your vote has not been counted"
                redirect_to login_path
            end
        end
    end
end
