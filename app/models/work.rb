class Work < ApplicationRecord
  has_many :users, through: :votes
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w(movie book album)}

  def self.by_category(category)
    category = category.singularize.downcase
    Work.where(category:category)
  end
  
end
