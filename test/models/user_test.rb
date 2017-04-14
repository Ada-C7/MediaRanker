require "test_helper"

describe User do
  let(:user) { User.new }

  it "must have a username" do
    user.wont_be valid?
  end
end
