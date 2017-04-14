class Work < ApplicationRecord

  # def self.show_category
  #    @books = Work.where(category: "book")
  #   @albums = Work.where(category: "album")
  #   @movies = Work.where(category: "movie")
  #
  # end
  has_many :votes
  validates :title, presence: true

  def self.spot_light
    max_votes = 0

    Work.all.each do |item|
      if item.votes.count > max_votes
        max_votes = item.votes.count
      end
    end

    spot = []
    Work.all.each do |item|
      if item.votes.count == max_votes
        spot << item
      end
    end
    return spot
  end

end
