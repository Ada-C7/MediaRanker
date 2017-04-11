require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "Works must have titles" do
    work.valid?.must_equal false
    #hash of all message
    work.errors.messages.must_include :title
  end

  it "If a title is given the work is valid" do
  book.title = "The Wizard of Oz"
  book.valid? #alternatively book.save.... book won't save until save.. or if valid is run, it will check the database for duplicates...but valid is more explicit about what we're trying to do here...which is test

# save will always run the validations
  book.errors.messages[:title].must_equal []
end

#postive test
it "You can create a book" do
  book.title = "The Wizard of Oz"
  book.isbn = "1111"

  author = Author.new name: "Kari"
  book.author = author

  book.valid?.must_equal true
end

end
