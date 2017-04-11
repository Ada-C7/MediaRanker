require "test_helper"

describe Work do
  # let(:work) { Work.new }
  #
  # it "must be valid" do
  #   value(work).must_be :valid?
  # end
  let(:work) { Work.new }

  it 'must be created with a title' do
    result = work.valid?
    result.must_equal false

    work.errors.messages.must_include :title
  end

  it 'must be created with a creator' do
    result = work.valid?
    result.must_equal false

    work.errors.messages.must_include :by
  end
end
