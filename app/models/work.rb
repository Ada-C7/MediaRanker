class Work < ApplicationRecord
  has_many :votes

  validates :category, inclusion: { in: %w(book movie album) }
  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publish_year, presence: true

# this method is not yet functional
  def top_10
    @all_votes = Vote.find(:all, :limit => 10, :order=> 'works_count desc')
  end
end
