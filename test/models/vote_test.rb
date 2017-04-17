require "test_helper"

describe Vote do
  let(:vote) { Vote.new }
  let(:user) { users(:betty) }
  let(:fred) { users(:fred) }
  let(:movie) { works(:anything) }
  let(:book) { works(:elemental) }
  let(:bettyvote) {votes(:betty_bookvote)}

  it "can set the user through 'user'" do
    bettyvote.user = fred
    bettyvote.user_id.must_equal fred.id
  end

  it "can set the user through 'user_id'" do
    bettyvote.user_id = fred.id
    bettyvote.user.must_equal fred
  end

  it "can set the work through 'work'" do
    bettyvote.work = movie
    bettyvote.work_id.must_equal movie.id
  end

  it "can set the work through 'work_id'" do
    bettyvote.work_id = movie.id
    bettyvote.work.must_equal movie
  end

  it "cannot create a vote without a work_id and a user_id" do
    vote.save
    vote.valid?.must_equal false
  end

  it "can create a vote with both a work_id and a user_id" do
    vote.user = user
    vote.work = movie
    vote.save
    vote.valid?.must_equal true
  end

  it "cannot create a second vote from the same user for the same work" do
    vote.user = user
    vote.work = book
    vote.save
    vote.valid?.must_equal false
  end


end
