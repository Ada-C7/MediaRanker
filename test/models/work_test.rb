require "test_helper"

describe Work do
  let(:work) { Work.new }

  describe "validations" do
    it "is invalid without a title" do
      work = works(:badlee)
      work.valid?.must_equal false
      work.errors.messages.must_include :title
    end

    it "is valid with a title" do
      works(:lee).valid?.must_equal true
    end

    it "is invlaid without a category" do
      work = works(:baddan)
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    it "is invlaid with an invalid category" do
      work = works(:badbelt)
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    it "is valid with a appropriate category" do
      works(:lee).valid?.must_equal true
    end

    it "is valid without a publication_year" do
      works(:belt).valid?.must_equal true
    end

    it "is valid without a creator" do
      works(:kinney).valid?.must_equal true
    end

    it "is valid without a description" do
      works(:dan).valid?.must_equal true
    end
  end

  describe "Entity Relationship" do
    it "can access Vote objects" do
      work = works(:lee)
      user = User.create(name: "ken")
      vote = Vote.create(user_id: user.id, work_id: work.id)
      work.votes[0].class.must_equal Vote
    end
  end  
end
