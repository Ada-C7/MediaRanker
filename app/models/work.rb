class Work < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :category, presence: true,
  inclusion: { in: %w(movie book album), message: "%{value} is not a valid category" }

  validates :name, presence: true

  validates :created_by, presence: true

  validates :pub_year, presence: true,
  numericality: { only_integer: true },
  length: { is: 4 }


  def self.top_ten(category)
    @top_ten = Work.where(category: category).order(votes_count: :desc)[0..10]
  end

  def self.spotlight
    @spotlight = Work.all.order(:votes_count).last
  end

  def self.top_category(category)
    @top_cat = Work.where(category: category).order(votes_count: :desc)
  end

end
