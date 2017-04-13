class Work < ApplicationRecord

  has_many :votes

  validates :title, presence: true
  validates :published, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, :in => ["book", "movie", "album"], :allow_nil => true

  def self.max_votes

    Work.order('votes_count DESC').limit(1).first

  end

  def self.top_ten(category)

    return Work.order('votes_count DESC').where(category: category).limit(10)

  end

end
