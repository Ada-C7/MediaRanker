require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    votes(:voteone).must_be :valid?
  end

  it "require user_id" do
    vote.valid?
    vote.errors.messages.must_include :user
  end

  it "require work_id" do
    vote.valid?
    vote.errors.messages.must_include :work
  end

# This test need a validation method in the model

#   it "a user can't vote for the same work more than once" do
#
#     vote1 = Vote.create(work_id: works(:movie1).id, user_id: users(:anderson).id)
#
#     vote2 = Vote.create(work_id: works(:movie1).id, user_id: users(:anderson).id)
#
#     vote2.valid?.must_equal false
#     vote.errors.messages.must_include :user
# end



end
