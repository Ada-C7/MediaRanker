require "test_helper"

describe WorksController do
  describe "index" do
    it "responds successfully" do
      Work.count.must_be :>, 0
      get works_path
      must_respond_with :success # success -  http status code
    end
    it "still responds successfully when there are no works " do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end  # end of index block
  describe "show" do
    it "shows a work that exists" do
      w = Work.first
      get work_path(w)
      must_respond_with :success
    end
    it "return a 404 not found status when work is not exist" do
      work_id = Work.last.id + 1
      get work_path(work_id) # sending request
      must_respond_with :not_found #checking respond
    end
  end # end of show block
  describe "new" do
    it "responds successfully " do
      get new_work_path
      must_respond_with :success
    end
  end #end of new block
  describe "create" do
    it "adds a work to the database" do
      work_data = {work: {category: "movie", title: "test title",creator: "creator test", publication_year: "1111", description: "description goes here" }}
      post works_path, params: work_data
      must_redirect_to movies_path
    end
    it "rerenders new work form if work is invalid" do
      work_data = {work: {title: "test titwle", category: "book"}}
      post works_path, params: work_data
      # must_respond_with :bad_request
      must_redirect_to new_book_path
    end
    it "changing size of works after creating" do
      proc {
        post works_path, params: { work: {category: "movie", title: "test title",creator: "creator test", publication_year: "1111", description: "description goes here" }}
      }.must_change 'Work.count', 1
    end
  end # end of create block

  describe "show_albums" do
    it "succesessfully shows a list of  albums " do
      get albums_path
      must_respond_with :success
    end
  end # end of show albums block
  describe "show_books" do
    it "succesessfully shows a list of  books " do
      get books_path
      must_respond_with :success
    end
  end # end of show books block
  describe "show_movies" do
    it "succesessfully shows a list of  movies " do
      get movies_path
      must_respond_with :success
    end
  end # end of show movies block

  describe "edit" do
    it "responds successfully " do
      work_id = Work.all.sample.id
      get edit_work_path(work_id)
      must_respond_with :success
    end
    it "return a 404 not found status when work to edit is not exist" do
      work_id = Work.last.id + 1
      get edit_work_path(work_id)
      must_respond_with :not_found
    end
  end # end of edit block

  describe "update" do
    it "updates a work in the database" do
      w = Work.first
      work_data = {work: w.attributes}
      work_data[:work][:title] = "test change"
      patch work_path(w.id), params: work_data
      must_redirect_to work_path(w.id)
    end
    it "rerenders new edit work form if work is invalid" do
      w = Work.first
      work_data = {work: w.attributes}
      work_data[:work][:title] = "Can't Buy a Thrill"
      patch work_path(w.id), params: work_data

      must_respond_with :bad_request
    end
  end # end of edit block

  describe "destroy" do
    it " successfully deletes from database" do
      w = Work.create!(category: "movie", title: "test title",creator: "creator test", publication_year: "1111", description: "description goes here" )
      delete work_path(w.id)
      must_redirect_to movies_path
    end
    it "after deletion, work doesn't exist anymore" do
      w = works(:royal_scam)
      delete work_path(w.id)
      Work.find_by(title: "test title").must_equal nil
    end
    it "changing size of works after deleting" do
      proc {
        w = works(:royal_scam)
        delete work_path(w.id), params: { work: {category: "movie", title: "test title",creator: "creator test", publication_year: "1111", description: "description goes here" }}
      }.must_change 'Work.count', -1
    end
    it "deleting votes that associated with deleted work" do
      w = works(:royal_scam)
      u = User.create(username: "natalia2", date_of_joining: "31/01/2012")
      v = Vote.create(work: w, user: u)
      before = Vote.count
      delete work_path(w.id)
      Vote.count.must_equal before - 1
    end
  end # end of edit block

  describe "upvote" do
    it " redirects back after creating new vote " do
      w = works(:royal_scam)
      u = User.create!(username: "nanana", date_of_joining: "12/01/2016")
      vote = Vote.create!(work: w, user: u)
      post upvote_path(w.id)
      must_redirect_to work_path(w.id)
    end

    it "changing votes number of votes after adding new vote" do
      proc {
        w = works(:royal_scam)
        u = User.create!(username: "nanana", date_of_joining: "12/01/2016")
        vote = Vote.create!(work: w, user: u)
        post upvote_path(w.id), params: {vote:{}}
      }.must_change 'Vote.count', 1
    end


  end # end of upvote block
  describe "downvote" do
    it " redirects back after deleting vote " do
      w = works(:royal_scam)
      u = User.create!(username: "nanana", date_of_joining: "12/01/2016")
      vote = Vote.create!(work: w, user: u)
      delete downvote_path(w.id)
      must_redirect_to work_path(w.id)
    end

  end # end of upvote block

end # end of class
