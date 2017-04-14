require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "Work requires a title" do
    work.title = nil
    work.valid?.must_equal false

  end
end
