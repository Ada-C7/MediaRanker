require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "creates a new work" do
    work = works(:work)
    work.valid?.must_equal true
  end

  it "requires a category to create a new work" do
    work = works(:work_no_category)
    work.valid?.must_equal false
  end

  it "requires a title to create a new work" do
    work = works(:work_no_title)
    work.valid?.must_equal false
  end

end
