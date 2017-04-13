require "test_helper"

describe Work do
  let(:work) { Work.new }

  # must have a title
  it "cannot create a work without a title" do
    work.valid?.must_equal false
  end

  # must have a published
  it "cannot create a work without a published" do
    work.title = "bolivia"
    work.valid?.must_equal false
  end

  # must have a description
  it "cannot create a work without a description" do
    work.title = "bolivia"
    work.published = "1985"
    work.valid?.must_equal false
  end

  # must have a category
  it "cannot create a work without a category" do
    work.title = "bolivia"
    work.published = "1985"
    work.description = "A lot of stuff about south america."
    work.valid?.must_equal false
  end

  # category must be "movie", "book", or "album"
  it "category must be movie, book, or album" do
    work.title = "bolivia"
    work.published = "1985"
    work.description = "A lot of stuff about south america."
    work.category = "movie"
    work.valid?.must_equal true
    work.category = "book"
    work.valid?.must_equal true
    work.category = "album"
    work.valid?.must_equal true
    work.category = "poo"
    work.valid?.must_equal false
    work.category = 0
    work.valid?.must_equal false
    work.category = nil
    work.valid?.must_equal false
  end

  # must be able to create new work
  it "must be able to create new work" do
    work = Work.new(title: "big stuff", published: 1986, description: "Some stuff here.", category: "movie")
    work.valid?.must_equal true
  end

end
