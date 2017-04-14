class Work < ApplicationRecord
  has_many :votes

  def self.by_category(category)
    category = category.singularize.downcase
    Work.where(category:category)
  end
end
