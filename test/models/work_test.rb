require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "Work requires a title" do
    # negative test
    work.title = nil
    work.valid?.must_equal false

    work.errors.messages.must_include :title
  end

  it "If a title is given the work is valid" do
    #postitive test
  end

  it "You can edit a work" do
  end

  it "You can create a new work" do
  end

  it "You can delete a work" do
  end

  it "You can upvote a work" do
  end

  it "Work can have many votes" do
  end

  it "Work talked to users through votes" do
  end
end
