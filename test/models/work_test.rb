require "test_helper"

describe Work do
  let(:work) { Work.new }
  #
  # it "must be valid" do
  #   value(work).must_be :valid?
  # end

  it "Movie requires a title" do
  work.valid?.must_equal false

  work.errors.messages.must_include :title
end




  it "If a title is given the movie is valid" do
  work.title = "Neemo"
  work.valid?

  work.errors.messages[:title].must_equal []
end

end
