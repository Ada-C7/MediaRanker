class Works::VotesController < ApplicationController
  # class Posts::LikesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_post

  def create
    @work.votes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @work.votes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  private

    def set_vote
      @work = Work.find(params[:post_id])
    end
end
