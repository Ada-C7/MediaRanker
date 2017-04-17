class Work < ApplicationRecord
    has_many :votes

    validates :category, presence: true, inclusion: {in: %w(book, movie, album)}
    validates :title, presence: true
end
