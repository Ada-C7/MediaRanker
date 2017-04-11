require "test_helper"

describe WorksController do
  #pos index
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  #pos index_books
  it "should get index_books page" do
    get books_path
    must_respond_with :success
  end

  #pos index_albums
  it "should get index_albums page" do
    get albums_path
    must_respond_with :success
  end

  #pos index_movies
  it "should get index_movies page" do
    get movies_path
    must_respond_with :success
  end

  #pos show test
  it "should get show page" do
    get work_path(works(:work_one).id)
    must_respond_with :success
  end

  #neg show test
  it "should show a 404 if work not found" do
    get work_path(1)
    must_respond_with :missing
  end

  #pos new
  it "should get form for new work" do
    get new_work_path
    must_respond_with :success
  end

  #pos create redirect
  it "should redirect to index after adding a work" do
    post works_path params: { work:
            { title: "Title",
              category: "book",
              creator: "creator",
              pub_yr: 1970,
              desc: "Desc" }
          }
    must_respond_with :redirect
    must_redirect_to works_path
  end

  #neg create route - testing that it will go to new page.
  it "should render new page if work was not saved" do
    post works_path params: { work:
            { title: "",
              category: "book",
              creator: "creator",
              pub_yr: 1970,
              desc: "Desc" }
          }
      must_respond_with :success
  end

  #pos create affect database test
  it "should affect the model when updating a book" do
    proc {
      post works_path, params: { work:
          { title: "Title",
            category: "book",
            creator: "creator",
            pub_yr: 1970,
            desc: "Desc" }
          }
      }.must_change 'Work.count', 1
  end

  #neg create test - Not sure if this is actually testing
  #What I want it to test.  - not updating db
  it "should not affect the model when book is invalid" do
    proc {
      post works_path, params: { work:
          { title: "",
            category: "book",
            creator: "creator",
            pub_yr: 1970,
            desc: "Desc" }
          }
      }.must_change 'Work.count', 0
  end

  #pos edit test
  it "should get form to edit work" do
    get edit_work_path((works(:work_one).id))
    must_respond_with :success
  end

  #neg edit test
  it "should show a 404 if work not found to edit" do
    get edit_work_path(1)
    must_respond_with :missing
  end

  #pos update test
  it "should update a work and redirect to works index" do
    put work_path(works(:work_one).id), params: {work: {title: "New Title", desc: "la la la"} }
    work = Work.find(works(:work_one).id)
    work.title.must_equal "New Title"
    work.desc.must_equal "la la la"
    must_respond_with :redirect
    must_redirect_to work_path(works(:work_one).id)
  end

  #neg update test - is this overkill b/c of Model testing??
  it "should not update a work if entry is invalid" do
    put work_path(works(:work_one).id), params: {work: {title: ""} }
    work = Work.find(works(:work_one).id)
    work.title.must_equal "My Work"
  end

  #pos destroy test redirect
  it "should delete a work and redirect to work list" do
      delete work_path(works(:work_one).id)
      must_redirect_to works_path
  end

  #pos destroy test affect DB
  it "should affect database " do
    proc { delete work_path(works(:work_one).id) }.must_change 'Work.count', -1
  end

  #neg destroy test?
  #destroy that something hasn't exist?  Count change delta?
end
