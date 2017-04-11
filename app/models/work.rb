class Work < ApplicationRecord
  validates :title, presence: true
  validates :by, presence: true
end
