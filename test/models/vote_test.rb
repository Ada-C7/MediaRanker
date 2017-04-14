require "test_helper"

describe Vote do

  describe 'validations' do
    it 'is invalid without parameters' do
      value(Vote.new).wont_be :valid?
    end

    it 'is invalid without a work ID' do
      vote = Vote.new(user_id: 1)

      value(vote).wont_be :valid?
      vote.errors.messages.must_include :work_id
    end

    it 'is invalid without a user ID' do
      vote = Vote.new(work_id: 1)

      value(vote).wont_be :valid?
      vote.errors.messages.must_include :user_id
    end

    it "must be valid when given appropriate parameters" do
      vote = votes(:one)

      vote.save.must_equal true
    end
  end

end
