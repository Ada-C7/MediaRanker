class Work < ApplicationRecord
     has_many :votes, dependent: :destroy

     validates :title, presence: true
     validates :title, uniqueness: true
    # def categories_list(works)
    #   @categories_list = []
    #   works.each do | work |
    #     @categories_list << work.category
    #     @categories_list = @categories_list.uniq
    #   end
    #   return @categories_list
    # end
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

end
