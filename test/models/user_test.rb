require "test_helper"

describe User do
  describe 'validations' do

    let(:user) { User.new(username: "Finding Nemo")}

    it 'passes when given good data' do
      user.valid?.must_equal true
    end

    it 'does not save new user when given bad data' do
      user = User.new()
      user.valid?.must_equal false
      user.errors.messages.must_include :username
    end

    it 'must be given unqiue user name' do
      user.save
      user2 = User.new(username: "Finding Nemo")
      user2.valid?.must_equal false
      user2.errors.messages.must_include :username
    end
  end
end
