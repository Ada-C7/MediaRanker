class User < ApplicationRecord

  has_many :votes
  has_many :works

  validates :username, presence: true
  validates :username, uniqueness: true

  def duplicate_vote?(id_of_work)

    # puts "in the method! ------------------------"
    # puts "#{id_of_work} is the id of work being voted on -----------------------"
    # work = Work.find_by_id(id_of_work)
    # duplicate = false
    # work.votes.each do |vote|
    #   puts "in the votes loop! -----------------------"
    #   if vote.work_id == id_of_work
    #     puts "duplicate vote! #{vote.work_id} == #{id_of_work} ------------------"
    #     return duplicate = true
    #
    #   end
    # end
    # puts "no duplicates found --------------------------"
    # return duplicate

  end


end
