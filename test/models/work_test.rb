require "test_helper"

describe Work do
  let(:work) { works(:elemental) }
  let(:work2) { Work.new }
  let(:betty_bookvote) { votes(:betty_bookvote) }
  let(:fred_bookvote) { votes(:fred_bookvote) }

  it "can't create a work without a title" do
    work2.valid?.must_equal false
    work2.errors.messages.must_include :title
  end

  it "can't create a work if title is duplicate for that category" do
    work2.category = "book"
    work2.title = work.title
    work2.save.must_equal false
    work2.valid?
    work2.errors.messages.must_include :title
  end

  it "can create work with duplicate title but different category" do
    work2.category = "album"
    work2.title = work.title
    work2.save.must_equal true
    work2.valid?
    work2.errors.messages[:title].must_equal []
  end

  it "can create a work in same category if unique title is provided" do
    work2.category = "book"
    work2.title = "A totally other thing"
    work2.save.must_equal true
    work2.valid?
    work2.errors.messages[:title].must_equal []
  end

  it "can find votes for the work through 'votes'" do
    work.votes.count.must_equal 2
  end
end
