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

end
