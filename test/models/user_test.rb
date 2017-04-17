require "test_helper"

describe User do
  describe 'validations' do
    it "Can be created with name" do
      a = User.create!(username: "Sofia")
      result = a.valid?
      result.must_equal true
    end
  end
end
