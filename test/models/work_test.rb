require "test_helper"

describe Work do
  let(:work) {Work.new }

  #what is this actually doing??
  it "must be valid" do
    #   my_work = works(:antonia)
    #   my_work.valid?
    #   my_work.must_be :valid?
      works(:antonia).must_be :valid?
  end

  it "must include valid category" do
      works(:antonia).validates_inclusion_of :category, in: %w(book, movie, album)
  end


  #this is not really working
  it "doesn't save something with an invalid category" do
      works(:bad_category).valid?
      works(:bad_category).errors.messages.wont_include :category
  end

  #do i need to test relationships here? how?

end
