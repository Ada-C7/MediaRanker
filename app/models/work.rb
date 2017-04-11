class Work < ApplicationRecord

  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :published, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, :in => ["book", "movie", "album"], :allow_nil => true

  def self.max_votes(array)
    max_votes = 0
    target = nil
    array.each do |work|
      if work.votes.count > max_votes
        max_votes = work.votes.count
        target = work
        puts "work is #{work}"
      end
    end
    return target
  end

  def self.top_ten(category)
    array = Work.where(category: category)
    all_counts = []
    array.each do |work|
      work_and_count = {title: work, count: work.votes.count}
      all_counts << work_and_count
    end
    all_counts = all_counts.group_by { |w| w[:count] }
    all_counts = all_counts.sort_by  { |k, v| -k }
    top_ten = all_counts.first(10)
    top_ten = top_ten.map(&:last).flatten
    puts "top_ten is #{top_ten}\n\n"
    puts "------------------------------"

    top_ten_titles = []
    top_ten.each do |hash|
      object = hash[:title]
      puts object
      top_ten_titles << object
    end
    puts "top_ten_titles is #{top_ten_titles}"
    return top_ten_titles.first(10)

  end

end
