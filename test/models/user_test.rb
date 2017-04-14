require "test_helper"

describe User do
  describe 'validations' do

    it "is invalid without a name" do
      user = users(:baduser)
      user.valid?.must_equal false
      user.errors.messages.must_include :name
    end

    it "is valid if given a name" do
      user = users(:two)
      user.valid?
      user.errors.messages[:title].must_equal []
    end

  end
end
