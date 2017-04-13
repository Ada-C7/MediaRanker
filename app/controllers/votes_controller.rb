class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end
  # def upvote
  #
  # end
end
