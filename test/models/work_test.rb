require 'test_helper'

class WorkTest < ActiveSupport::TestCase

  #negative test

  describe Work do
    let(:work) { Work.new }

    it "Cannot create a work without an category" do
      work.valid?.must_equal false
      #another way of saying, this work is not valid
      work.errors.messages.must_include :category
    end

    it "Cannot create a work without an title" do
      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    it "Cannot create a work without an creator" do
      work.valid?.must_equal false
      work.errors.messages.must_include :creator
    end

    #positive test - if you give it a title field its passed its validations
    it "If a category is given the book is valid" do
      work.category = "Movie"
      work.valid?
      work.error.messages[:category].must_equal [] #but, why an array again?
    end

    #positive test
    it "You can create a work" do
      work.category = "Album"
      work.title = "Look, a record!"
      work = Work.new creator: "Band Who Can Afford To Press Vinyl"
      work.creator = creator
      work.valid?.must_equal true
    end

    it "Works must have unique id nums" do

      work.id = "13"
      work.creator = "Chastity Belt"
      work.title = "Time To Go Home"
      work.save.must_equal true

      work2 = Work.new
      work2.id = "13"
      work2.creator = "P.W. Herman"
      work2.title = "Fire Hose Blues"
      work2.save.must_equal false
      work2.errors.messages.must_include :id
      work2.errors.messages.must_equal ["must be unique"] #must understand use of array
    end
  end
  #
end
