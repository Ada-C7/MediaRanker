require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "Works must have titles" do
    work.valid?.must_equal false
    #hash of all message
    work.errors.messages.must_include :title
  end

  it "Works must have categories" do
    work.title = "A Title"
    work.valid?.must_equal false

    work.errors.messages.must_include :category
  end

  it "If a title and category are given the work is valid" do
  work.title = "The Wizard of Oz"
  work.category = "movie"
  work.valid? #alternatively book.save.... book won't save until save.. or if valid is run, it will check the database for duplicates...but valid is more explicit about what we're trying to do here...which is test

# save will always run the validations
  work.errors.messages[:title].must_equal []
  work.errors.messages[:category].must_equal []
end

#postive test
it "You can create a work" do
  work.title = "The Wizard of Oz"
  work.creator = "Hello"
  work.publication_year = 1989
  work.category = "book"

  work.valid?.must_equal true
end

end
