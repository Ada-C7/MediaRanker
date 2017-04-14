module WorksHelper
  # only available in your views
  def find_path(work)
    if work.category == "movie"
      return movies_path
    elsif work.category == "book"
      return books_path
    elsif work.category == "album"
      return albums_path
    end
  end

  def find_top_ten(works)
    works.sort_by { |work| work.votes.count }.reverse[0..9]
  end
end
