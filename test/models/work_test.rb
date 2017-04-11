require "test_helper"

describe Work do
  let(:work) { works(:bnb, :obvchild, :soviet, :lungs, :supe, :uproot).sample }

  # 2+ tests for each validation on a model

  # category
  # positive
  it "Works are valid with category" do
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
    skip
    work.valid?.must_equal false
  end
  # negative length
  it "Works are invalid if the pub_year is not 4-digits long" do
    skip
    work.valid?.must_equal false
  end

  # desc
  # positive
  it "Works are valid with desc" do
    work.valid?
    work.errors.messages[:desc].must_equal []
  end

  # negative
  it "Works are invalid without desc" do
    work = Work.create(category: "movie", name: "test", created_by: "test buddy", pub_year: 1000)
    work.valid?.must_equal false
    work.errors.messages.must_include :desc
  end


  # 1+ test for each custom method

  # 1+ test for each model relationship


end
