require "test_helper"

describe Work do
  let(:work) { works(:bnb, :obvchild, :soviet, :lungs, :supe, :uproot).sample }
  let(:winner) { works(:bnb) }
  # let(:vote) { votes(:vote_bnb, :vote_obvchild, :vote_soviet, :vote_uproot) }

  # 2+ tests for each validation on a model
  describe "validations" do
    # category
    # positive
    it "Works are valid with a category that is movie, book, or album" do
      work.valid?
      work.errors.messages[:category].must_equal []
    end

    # negative
    it "Works are invalid without category" do
      work = Work.create(name: "test", created_by: "test buddy", pub_year: 1000, desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    # category must be movie, album, or book
    it "Works are invalid if the category is not movie, book, or album" do
      work = Work.create(category: "video game", name: "test", created_by: "test buddy", pub_year: 1000, desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :category
    end

    # name
    # positive
    it "Works are valid with name" do
      work.valid?
      work.errors.messages[:name].must_equal []
    end

    # negative
    it "Works are invalid without name" do
      work = Work.create(category: "movie", created_by: "test buddy", pub_year: 1000, desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :name
    end

    # created_by
    # positive
    it "Works are valid with created_by" do
      work.valid?
      work.errors.messages[:created_by].must_equal []
    end

    # negative
    it "Works are invalid without created_by" do
      work = Work.create(category: "movie", name: "test", pub_year: 1000, desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :created_by
    end

    # pub_year
    # positive presence
    it "Works are valid with pub_year that is a 4-digit long integer" do
      work.valid?
      work.errors.messages[:pub_year].must_equal []
    end

    # negative presence
    it "Works are invalid without pub_year" do
      work = Work.create(category: "test", name: "test", created_by: "test buddy", desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :pub_year
    end

    # negative numerical
    it "Works are invalid if the pub_year is not an integer" do
      work = Work.create(category: "movie", name: "test", created_by: "test buddy", pub_year: "the 80s", desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :pub_year
    end

    # negative length
    it "Works are invalid if the pub_year is not 4-digits long" do
      work = Work.create(category: "book", name: "test", created_by: "test buddy", pub_year: 10, desc: "hi test it's me")
      work.valid?.must_equal false
      work.errors.messages.must_include :pub_year
    end
  end

  # 1+ test for each custom method
  describe "methods" do
    #top_ten
    it "top_ten returns array of 10 movies or books or albums in descending order" do
      category = ['movie', 'book', 'album'].sample
      10.times do
        Work.create(name: "test",
        category: category,
        created_by: "test buddy",
        pub_year: 1000,
        desc: "hi test it's me")
      end

      Work.top_ten(category).length.must_equal 10
      Work.top_ten(category).each do |work|
        work.must_be_instance_of Work
        work.category.must_equal category
      end

      winner = works(:soviet)
      winner.votes_count += 100
      runnerup = works(:lungs)
      runnerup.votes_count += 50
      Work.top_ten('album')[0].name.must_equal winner.name
      Work.top_ten('album')[1].name.must_equal runnerup.name
    end

    #spotlight
    it "returns one work" do
      winner.votes_count += 100
      Work.spotlight.name.must_equal winner.name
    end

    #top_category
    it "returns all works in specified category" do
      category = ['movie', 'book', 'album'].sample
      Work.top_category(category).length.must_equal Work.where(category: category).length
    end
  end

  # 1+ test for each model relationship
  describe "relationships" do
    # has_many votes
    it "returns an array of votes" do
      work.votes.each do |vote|
        vote.must_be_instance_of Vote
        vote.work.must_equal work
      end
    end

    # does not pass but works on website, error in test syntax?
    it "retuns an empty array of votes when work deleted" do
      deleted_work = works(:bnb)
      deleted_work_votes = deleted_work.votes
      deleted_work.destroy
      deleted_work_votes.must_be_empty
    end
  end
end
