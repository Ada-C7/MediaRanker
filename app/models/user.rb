class User < ApplicationRecord

  has_many :votes
  has_many :works, though: :votes

  def index
  end
end
