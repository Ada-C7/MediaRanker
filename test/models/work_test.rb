require "test_helper"

describe Work do
  # let(:work) { Work.new }
  #
  # it "must be valid" do
  #   value(work).must_be :valid?
  # end

  it 'must be created with a title' do
    work = Work.new
    result = work.valid?
    result.must_equal false

    work.errors.messages.must_include :title
  end
end
