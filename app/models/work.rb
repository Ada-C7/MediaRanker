class Work < ApplicationRecord
  validates :title, presence: true
  validates :by, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :media_type, presence: true
end
