require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "Cannot create a work without a Title" do
    work.valid?.must_equal false
    work.errors.must_include :title
  end

  it "Can create a Work" do
    work.title = "My Book"
    work.valid?.must_equal true
  end

  it "Publisher year cannot be in future" do
    work.title = "My Book"
    work.pub_yr = 0
    work.valid?.must_equal false
    work.errors.messages.must_include :pub_yr
  end

end
