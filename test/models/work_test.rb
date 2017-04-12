require 'test_helper'

 class WorkTest < ActiveSupport::TestCase

  #negative test

  describe Work do
    let(:work) { Work.new }

    it "Cannot create a work without an title" do
      work.valid?.must_equal false
      #another way of saying, this book is not valid
      work.errors.messages.must_include :title
    end

#     #positive test - if you give it a title field its passed its validations
#     it "If a title is given the book is valid" do
#       book.title = "Wizard"
#       book.valid?
#       book.error.messages[:title].must_equal []
#     end
#
#     #positive test
#     it "You can create a book" do
#       book.title = "Wizard"
#       book.isbn = "11111"
#       author = Author.new name: "Kari"
#       book.author = author
#       book.valid?.must_equal true
#     end
#
#   it "ISBN must be included in the creation of a book" do
#     book.valid?.must_equal false
#     book.errors.messages.must_include :isbn
#   end
#
#     it "Books must have unique ISBN nums" do
#
#       book.isbn = "11111"
#       book.author = "H.Baggins"
#       book.title = "The Shire"
#       book.save.must_equal true
#
#       book2 = Book.new
#       book2.isbn = "11111"
#       book2.author = "Plantain Man"
#       book2.title = "Fire Hose Blues"
#       book2.save.must_equal false
#       book2.errors.messages.must_include :isbn
#       book2.errors.messages.must_equal ["must be unique"] #must understand use of array
#     end
  end
#
end
