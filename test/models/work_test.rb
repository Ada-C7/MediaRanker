require "test_helper"

describe Work do
  let(:work) { Work.new }



  it "Cannot create a work without a title" do
      work.valid?.must_equal false
      #negative test

      work.errors.messages.must_include :title
      #negative test
    end


    it "Can create a work with a title" do
      work.title = "Something here"


      work.valid? #won't run validations until save or valid? is run
      work.errors.messages[:title].must_equal []
    end
    #
    #
    it "You can create a work" do
      work.title = "Hallo"
      work.category = "book"
      work.year_published = "1945"
      work.valid?.must_equal true
    end
    #
    it "title must be unique" do
      work1 = Work.new
      work1.title = "Red Fish"
      work1.save
      work2 = Work.new
      work2.title = "Red Fish"
      work2.valid?.must_equal false
      # work2.errors.messages.must_include :isbn
      work2.errors.messages[:title].must_equal ["has already been taken"]
    end

end
