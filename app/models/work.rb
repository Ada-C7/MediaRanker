class Work < ApplicationRecord
  validates :title, presence: true
  validates :by, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :media_type, presence: true

  def self.books
    @books = Work.where(media_type: 'book')
  end

  def self.albums
    @albums = Work.where(media_type: 'album')
  end
end
