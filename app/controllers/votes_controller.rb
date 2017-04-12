class VotesController < ApplicationController
  def upvote
    work = Work.find_by_id(params[:id])
    vote = Vote.new(
      work_id: work.id,
      user_id: 1
    )

    vote.save
    redirect_to "/#{work.category.pluralize}/#{work.id}"
  end
end
