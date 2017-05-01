require "test_helper"

describe User do
  let(:user) { User.create!(name: "Lau") }
  let(:user_no_name) { User.create }
  let(:user_blank) { User.create(name: " ")}

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "Do not let create a new user without a name" do
    user_no_name.valid?.must_equal false
  end

  it "Requires presence of name" do
    user_blank.valid?.must_equal false
  end

  it "name should be unique" do
    u = user
    u1 = User.create(name: "Lau")
    u1.valid?.must_equal false
  end
end
