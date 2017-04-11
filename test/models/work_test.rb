require "test_helper"

describe Work do

  let(:book) { works(:book) }
  let(:album) { works(:album) }
  let(:movie) { works(:movie) }

  it "all works require a title" do
    book.title = nil
    book.save.must_equal false
  end

  it "all works require a mediatype" do
    book.mediatype = nil
    book.save.must_equal false
  end
end
