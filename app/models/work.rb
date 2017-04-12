class Work < ApplicationRecord
  has_many :votes

def self.by_category(category)
  where(category: category) #normally it would be work.where but since it's a self class it's not needed
end

end
