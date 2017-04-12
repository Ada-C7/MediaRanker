require "test_helper"

describe Work do

  describe 'validations' do
    it 'is invalid without parameters' do
      value(Work.new).wont_be :valid?
    end

    it 'is invalid without a title' do
      work = works(:missing_title)

      value(work).wont_be :valid?
      work.errors.messages.must_include :title
    end

    it "must be valid when given appropriate parameters" do
      value(works(:rubber_soul)).must_be :valid?
    end

    it "must have a unique title" do
      work = works(:rubber_soul)
      work.save.must_equal true

      duplicate_work = Work.new(title: work.title)

      duplicate_work.save.must_equal false
      duplicate_work.errors.messages[:title].must_equal ["has already been taken"]
    end
  end

end
