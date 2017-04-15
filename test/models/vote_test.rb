require "test_helper"

describe Vote do
  it "returns user with association"do
  votes(:one).user.username.must_equal "sofia"
end

  it "returns work with association"do
  votes(:one).work.title.must_equal "Kindred"
  end
end
