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

  it "Should show a 404 when meduim not found" do
  get work_path(1)
  must_respond_with :missing
  end

  #Testing forms

  it "Should show a new medium" do
    get new_work_path
    must_respond_with :success
  end

  it "Shoud redirect to full list after adding a medium" do

  post works_path, works(:movie1)
  must_redirect_to works_path
  end

  it "Shoud affect the model when creating a meduim" do

    proc{

   post works_path, params: {work:
  { title:"Neemo",
    creator: 'Helen Anderson',
    publication_year: 2005
    description: 'Curious fish got lost'
  }
}


}.must_change 'Book.count', 1




  end






end
