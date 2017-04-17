class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true, uniqueness: true

  def joined
    self.created_at.strftime("%b %d, %Y")
  end

end
