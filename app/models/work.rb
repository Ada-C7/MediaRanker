class Work < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w(movie book album)}

  def self.by_category(category)
    work = category.singularize.downcase
    Work.where(category:category)
  end
end
