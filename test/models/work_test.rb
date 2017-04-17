require "test_helper"

describe Work do
 describe "validations" do

  it "must have one of a category" do
     work = Work.create(title: "Song")
     result = work.valid?
     result.must_equal false
     work.errors.messages.must_include :category
  end

  it "must have one of three categories" do
     work = Work.create(title: "Song", category: "music")
     result = work.valid?
     result.must_equal false
     work.errors.messages.must_include :category
  end

  it "Must have a unique title" do
     work1 = Work.create!(title: "Song", category: "book")
     work2 = Work.create(title: "Song", category: "book")
     result = work2.valid?
     result.must_equal false
     work2.errors.messages.must_include :title
  end

  it "allows to create if it's not in the same category as the other work with the same title" do
     work1 = Work.create(title: "Song", category: "movie")
     work2 = Work.create(title: "Song", category: "book")
     result = work2.valid?
     result.must_equal true
  end

  it "blah" do
    works = Work.all
    works.count.must_equal 3
  end
 end
end
