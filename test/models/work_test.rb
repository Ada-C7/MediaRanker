require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "creates a new work" do
  end

  it "requires a category to create a new work" do
  end

  it "requires a title to create a new work" do
  end

end
