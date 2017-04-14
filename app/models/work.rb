class Work < ApplicationRecord
  has_many :votes
  # validates :, presence: true
  # before_validation :fix_category
  # validates :title, presence: true, uniqueness: { scope: :category }
  # validates :category, presence: true, inclusion: { in: %w(album book movie)}

  def self.by_category(category)
    # category = category.singularize.downcase
    where(category: category) #normally it would be work.where but since it's a self class it's not needed
  end


private
  def fix_category
    if self.category
      self.category = self.category.downcase.singularize
    end
  end
end
