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
  # Write at least two tests for each scope on a model (we’ll talk about scopes next week)


end
