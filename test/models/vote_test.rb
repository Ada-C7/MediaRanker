require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  describe "vote" do

    it "must be valid" do
      Vote.new.must_be :valid?
    end
  end
end
