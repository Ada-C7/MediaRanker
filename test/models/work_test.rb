require "test_helper"

describe Work do
  describe "relations" do
    before { @new_vote = Vote.create!(user: users(:user1), work: works(:coexist)) }

    it "adds a new vote that belongs to it to its 'votes' collection" do
      works(:coexist).votes.must_include @new_vote
    end

    it "adds a new user to its 'users' collection through votes" do
      works(:coexist).users.must_include users(:user1)
    end
  end

  describe "validations" do
    it "can be created with all attributes" do
      Work.create!(
        title: "Every Kingdom",
        creator: "Ben Howard",
        category: "album",
        publication_year: "2011",
        description: "Ben Howard's first album featuring Old Pine and Only Love"
      )
    end

    def confirm_error_message(work, attribute)
      work.valid?.must_equal false
      work.errors.messages.must_include attribute
    end

    it "requires a title" do
      work = Work.new
      confirm_error_message(work, :title)
    end

    it "requires a category" do
      work = Work.new
      confirm_error_message(work, :category)
    end

    it "requires that the category can only be a album, movie, or book" do
      work = Work.new(category: "play")
      confirm_error_message(work, :category)
    end

    it "requires the publication year to be an integer" do
      work = Work.new(publication_year: "test_year")
      confirm_error_message(work, :publication_year)
    end

    it "requires the publication year to be greater than or equal to 1500" do
      work = Work.new(publication_year: 1499)
      confirm_error_message(work, :publication_year)
      Work.create!(title: "test title", category: "book", publication_year: 1500)
    end

    it "requires the publication year to be the current year or earlier" do
      current_year = Date.today.year
      work = Work.new(publication_year: current_year + 1)
      confirm_error_message(work, :publication_year)
      Work.create!(title: "title", category: "book", publication_year: current_year)
    end

    it "allows a work to be created without a publication year" do
      work = Work.new
      work.valid?.must_equal false
      work.errors.messages.wont_include :publication_year
    end
  end

  describe "spotlight" do
    it "returns a work" do
      Work.spotlight.must_be_instance_of Work
    end

    it "returns nil if no works exist" do
      Work.destroy_all
      Work.spotlight.must_be_nil
    end

    it "returns the work with the most votes" do
      User.create!(username: "test user")
      work = Work.create!(
        title: "Every Kingdom",
        creator: "Ben Howard",
        category: "album"
      )

      User.all.each do |user|
        Vote.create!(user: user, work: work)
      end

      Work.spotlight.must_equal work
    end
  end

  describe "top_ten" do

    it "returns an active record collection of work objects" do
      top_books = Work.top_ten("book")
      top_books.must_be_instance_of Array

      top_books.each do |book|
        book.must_be_instance_of Work
      end
    end

    it "returns up to ten works sorted by the number of votes in descending order" do
      top_albums = Work.top_ten("album")
      if top_albums.count >= 10
        top_albums.count must_be 10
      else
        top_albums.count.must_be :<, 10
      end

      first_ablum_votes = top_albums.first.votes.count
      last_album_votes = top_albums.last.votes.count
      first_ablum_votes.must_be :>=, last_album_votes
    end

    it "returns nil if the given category is not an album, book, or movie" do
      Work.top_ten("play").must_be_nil
    end

    it "returns nil if no works exist in a given category" do
      Work.destroy_all
      Work.top_ten("ablum").must_be_nil
    end
  end
end
