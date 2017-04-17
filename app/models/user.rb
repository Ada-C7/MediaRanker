class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :name, presence: true, uniqueness: true

  def self.from_github(auth_hash)
    user = User.new
    user.name = auth_hash['info']['nickname']
    user.oauth_uid = auth_hash['uid']
    user.email = auth_hash['info']['email']
    user.oauth_provider = 'github'
    return user
  end
end
