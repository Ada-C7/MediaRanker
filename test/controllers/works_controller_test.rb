require "test_helper"

describe WorksController do

  it "Should get index" do
    get works_path
    must_respond_with :success
  end

  it "Sould get show" do
    get work_path(works(:movie1).id)
    must_respond_with :success
  end

  # it "Should show a 404 when meduim not found" do
  # get work_path(1)
  # must_respond_with :missing
  # end

  #Testing forms
  it "Should show a new medium" do
    get new_work_path
    must_respond_with :success
  end

  it "shoud redirect to full list after adding a meduim" do

      post works_path, params: {work:
      { category: "movie",
      title: "Neemo",
      creator: "Helen Anderson",
      publication_year: 2005,
      description: "Curious fish got lost"
      }}

      must_redirect_to works_path
    end

  it "Should show a new movie" do
    get new_work_path(works(:movie1))
    must_respond_with :success
  end

  it "Should show a new book" do
    get new_work_path(works(:book1))
    must_respond_with :success
  end

  it "Should show a new album" do
    get new_work_path(works(:album1))
    must_respond_with :success
  end


  it "shoud affect the model when creating a movie" do

proc{

   post works_path, params: {work:
  { category: "movie",
  title: "Neemo",
  creator: "Helen Anderson",
  publication_year: 2005,
  description: "Curious fish got lost"
  }
}

}.must_change 'Work.count', 1
end

  it "delete a medium and redirect to mediaranker list" do
    delete work_path(works(:movie1).id)
    must_redirect_to works_path
  end








end
