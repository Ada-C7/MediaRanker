require "test_helper"

describe Vote do
  describe 'validations' do

    it "is invalid without a work id" do
      vote = votes(:bady2)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :work_id
    end

    it "is invalid with a non-integer work id" do
      vote = votes(:bady2)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :work_id
    end

    it "is valid if given a work id" do
      vote = votes(:goody)
      vote.valid?
      vote.errors.messages[:work_id].must_equal []
    end

    it "is invalid without an user id" do
      vote = votes(:bady)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :user_id
    end

    it "is invalid with a non-integer user id" do
      vote = votes(:bady2)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :user_id
    end

    it "is valid if given an user id" do
      vote = votes(:goody)
      vote.valid?.must_equal true
      vote.errors.messages[:user_id].must_equal []
    end

  end
  describe 'relations' do
    it "has one a user" do
    end

    it "has a work" do

    end

    it "cannot create a vote without a user or work" do

    end
  end

  describe '#already_created' do
    it "must return false if work id and user id exist for this vote" do

    end

    it "must return turn if work id and user id do not already exist for this vote" do

    end
  end
end
