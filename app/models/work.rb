class Work < ApplicationRecord

  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :published, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, :in => ["book", "movie", "album"], :allow_nil => true

  def self.max_votes
    @works = Work.all
    max_votes = 0
    target = nil
    @works.each do |work|
      if work.votes.count > max_votes
        max_votes = work.votes.count
        target = work
        puts "work is #{work}"
      end
    end
    return target
  end

end
