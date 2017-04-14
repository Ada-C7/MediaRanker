require "test_helper"

describe Work do
  let(:work) { Work.new }


  # Write at least one test for each custom method on a model

  # Write at least one test for each model relationship on a model

  # Write at least two tests for each validation on a model
  it "cannot create a work with a title" do
    work.valid?.must_equal false
  end

  it "can create a book" do
    work.title = "The Great Great"
    work.save.must_equal true
end

  it "Return data matches database data" do
    one = works(:one)
    one.title.must_equal 'MyString'
    one.description.must_equal 'MyText'
    one.year_published.must_equal 1
    one.category.must_equal 'MyString'
    one.creator.must_equal 'MyString'
  end

  it "Non required fields can be left blank" do
    one = works(:two)
    one.title.must_equal 'MyString'
    one.description.must_be_nil
    one.year_published.must_equal 1
    one.category.must_equal 'MyString'
    one.creator.must_be_nil
  end

  # Write at least two tests for each scope on a model (we’ll talk about scopes next week)


end
