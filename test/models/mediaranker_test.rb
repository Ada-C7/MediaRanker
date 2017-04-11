require "test_helper"

describe Mediaranker do
  let(:mediaranker) { Mediaranker.new }

  it "must be valid" do
    value(mediaranker).must_be :valid?
  end
end
