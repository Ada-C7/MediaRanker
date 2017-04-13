class User < ApplicationRecord

  def self.find_or_create(username)
    user = User.find_by_username(username) # this would return a user object with an id if we found a user

    if user == nil
      user = User.create(:username => username)
    end
    user
  end
end
