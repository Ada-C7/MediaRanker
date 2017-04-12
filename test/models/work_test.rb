require "test_helper"

describe Work do

  let(:book) { works(:book) }
  let(:album) { works(:album) }
  let(:movie) { works(:movie) }

  it "all works require a title" do
    book.title = nil
    book.save.must_equal false
  end

  # need to fix so that only allows category to be movie, book or album
  it "all works require a category" do
    book.category = nil
    book.save.must_equal false
  end

  it "is able to create a new work" do
    book.title = "The Wizard of Oz"
    book.valid?

    book.errors.messages[:title].must_equal []
  end
end
