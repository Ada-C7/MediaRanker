class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  # 
  # validates :isbn, uniqueness: true
end
