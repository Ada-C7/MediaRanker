class User < ApplicationRecord
     has_many :votes

     validates :username, presence: { message: "Can't nobody vote without a name." },
          uniqueness: { message: "Sorry. That username is taken by someone more keen than you. Try another one." },
          length: { minimum: 3, message: "Nice try. Make a minimal effort. Three-letter minimum." }
end
