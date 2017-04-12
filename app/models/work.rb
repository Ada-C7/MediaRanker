class Work < ApplicationRecord

  def books
    Work.where(category: "book")
  end

  def albums
    Work.where(category: "album")
  end

  def movies
    Work.where(category: "movies")
  end
end
