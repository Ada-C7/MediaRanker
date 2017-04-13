require "test_helper"

describe WorksController do
  #one nested describe block for each controller
  describe "index" do #model method #wants you to ignore the instance variables, just focus on request and responses. if i put this in the black box, what do I get out of the black box?
    it "Responds successfully" do
      Work.count.must_be :>, 0 #if no books, we want to fail this test immediately
      get works_path #sending get request to the url
      must_respond_with :success #success corresponds to a status code
    end
    #what if there aren't any books?
    it "still responds successfully when there are no works" do
      Work.destroy_all #wipes the test database (populated from fixtures) for this test. ok to do this because the test database regenerates for each test.
      get works_path
      must_respond_with :success
    end
  end

  describe "new" do
    #tests like above, but maybe simpler - only one - if I send a new request do i get a success response?
    it "Responds successfully" do
      get new_work_path #sending get request to the url
      must_respond_with :success #success corresponds to a status code
    end
  end

  describe "create" do
    #positive case - if we give it good data, it should create a book
    it "adds a work to the database" do
      work_data = {
        work: {
          category: "book",
          title: "Jane Eyre",
          creator: "Charlotte Bronte",
          publication_year: 1978,
          description: "Empowering female gothic romance"
          }
        } #saved data in a hash within a hash and as a local variable
      post works_path, params: work_data
      must_redirect_to works_path
    end

    #what happens when you send invalid data?
    #if there is an if statement - test both sides
    it "re-renders the new work form if the book is invalid" do
      work_data = { work: { title: "Jane Eyre"} }
      post works_path, params: work_data
      must_respond_with :bad_request
    end
  end

  describe "show" do
    it "shows a work that exists" do
      work = Work.first
      get work_path(work)
      must_respond_with :success
      #we are not ever checking the book that was pulled out of the database.
    end

    it "will return a 404 not found status when asked for a work that doesn't exist" do
      work_id = Work.last.id
      work_id += 1
      get work_path(work_id)

      must_respond_with :not_found
    end
  end

  describe "update" do
    it "updates a work" do
      work_data = {
        work: {
          category: "book",
          title: "Jane Eyre",
          creator: "Charlotte Bronte",
          publication_year: 1978,
          description: "Empowering female gothic romance"
          }
        }
      work = Work.first
      patch work_path(work), params: work_data
    end

  end

  describe "destroy" do
    it "deletes a work that exists" do
      work = Work.first
      delete work_path(work)
      must_redirect_to works_path
    end

  end
end
