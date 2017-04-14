require "test_helper"

describe Work do
  describe 'validations' do
    # let(:work) { Work.new }

    it "is invalid without a title" do
      work = works(:bady2)
      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    it "is valid if given a title" do
      work = works(:goody)
      work.valid?
      work.errors.messages[:title].must_equal []
    end

    it "is invalid without a category" do
      work = works(:bady)
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    it "is valid if given a category" do
      work = works(:goody)
      work.valid?.must_equal true
      work.errors.messages[:category].must_equal []
    end

  end
  describe 'relations' do
    it "has one or many votes" do
      work = works(:goody)
      work.votes.count.must_equal 1
      work.votes.users.must_include "grace"
    end

  # I wanted to test the relationship between Work and Vote, but am having a hard time knowing how to write the test for this. Also, a TA said to me that I shouldn't be testing that AR works, because associations are structure and don't need to be tested, whereas validations are behavior and so need testing.
  end

end
