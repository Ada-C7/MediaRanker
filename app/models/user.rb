class User < ApplicationRecord
    has_many :votes
    has_many :works, through: :votes

    validates :name, presence: true, uniqueness: true, format: { with: /\A[-\w.]*\z/, message: ': Only accepts letters, numbers, period, hyphens and underscore allowed' }
end
