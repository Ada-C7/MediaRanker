class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true, uniqueness: { scope: :category,
    message: "Cannot have two work with the same title in the same category" } 

  # def category_not_match
  #   a = Work.where(category: self.category).where(title: self.title)
  #   if a.category == self.category
  #     return true
  #   end
  # end

  validates :category, presence: true, inclusion: %w(album book movie)
end
#validates scope:
