class Work < ApplicationRecord

  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :published, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, :in => ["book", "movie", "album"], :allow_nil => true

end
