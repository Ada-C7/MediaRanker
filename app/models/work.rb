class Work < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w(movie book album)}

  def self.by_category(category)
    Work.where(category:category)
  end

end
