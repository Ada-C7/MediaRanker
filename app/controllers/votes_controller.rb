class VotesController < ApplicationController
  belongs_to :users
   belongs_to :works , :counter_cache => :users_count


end
