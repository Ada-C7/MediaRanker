require "test_helper"

describe Work do
  # let(:work) { Work.new }
  #
  # it "must be valid" do
  #   value(work).must_be :valid?
  # end
  let(:work) { Work.new }

  it 'must be created with every field populated' do
    result = work.valid?
    result.must_equal false

    work.errors.messages.must_include :title && :by && :year && :descrition && :media_type
  end
end
