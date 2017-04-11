require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "cannot create a work without a title" do
    work.valid?.must_equal false
    work.errors.messages.must_include :title
  end

  it "cannot create a work if the title is not unique" do
    work = works(:elemental)
    work.save.must_equal true

    work2 = Work.new
    work2.category = "book"
    work2.title = work.title
    work2.save.must_equal false
    work2.valid?
    work2.errors.messages.must_include :title
  end

  it "can create a work if a unique title is provided" do
    work.title = "Test"
    work.valid?
    work.errors.messages[:title].must_equal []
  end


end
