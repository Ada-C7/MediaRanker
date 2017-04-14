class Work < ApplicationRecord

    has_many :votes
    has_many :users, though: :votes

  def index
  end
end
