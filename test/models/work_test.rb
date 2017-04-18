require "test_helper"
describe Work do


  describe "validations" do
    it "can be created with all attributes" do
      a = Work.create!(title: "kissed by a rose", category: "album", created_by: "SEAL", description: "best love song of the 90s", published: "london")
      result = a.valid?
      result.must_equal true
    end

    it "requires a title" do
      a = Work.new(category: "album", created_by: "seal")
      result = a.valid?
      result.must_equal false
    end

    it "requires a unique title" do
      a = Work.create!(title: "kissed by a rose", category: "album", created_by: "SEAL", description: "best love song of the 90s", published: "london")
      b = Work.new(title: "kissed by a rose", category: "album", created_by: "seal")
      result = b.valid?
      result.must_equal false
    end

    it "requires an author" do
      a = Work.new(category: "album")
      result = a.valid?
      result.must_equal false
    end

    it "does not require a unique author" do
      a = Work.create!(title: "rose kisses", category: "album", created_by: "SEAL", description: "best love song of the 90s", published: "london")
      b = Work.new(title: "kissed by a rose", category: "album", created_by: "SEAL")
      result = b.valid?
      result.must_equal true
    end

  end


  describe "testing relations" do

    it "can count how many votes it has" do
      work= Work.find(2)
      work.votes.length.must_equal 2
    end

    it "can find a user's name through their vote" do
      work= Work.find(2)
      a = work.votes[0].user_id
      b = User.find(a).username
      b.must_equal "sara"

    end
  end

    describe "testing model methods" do
      it "can display a single category" do
        books = Work.show_category("book")
        books.each{|book| book.category.must_equal "book"}
      end
    end
end
