require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should show one work" do
    get work_path(works(:anne).id)
    must_respond_with :success
  end

  # it "should show a 404 when book not found" do
  #     get work_path(1)
  #     must_respond_with :missing
  #   end


  it "should delete a book and redirect to book list" do
    delete work_path(works(:anne).id)
    must_redirect_to books_path
  end

  it "should affect the model when deleting a book" do
    start_count = Work.count
    delete work_path(works(:anne).id)

    end_count = Work.count

    (start_count - end_count).must_equal 1
  end

  it "should get edit form" do
    get edit_work_path(works(:gotmail).id)
    must_respond_with :success
  end

  it "should change the model object when updated" do
    get edit_work_path(works(:anne).id)

    title_change = { work:
      {
        title: "changed this"
      }
    }
    start_count = Work.count

    put work_path(works(:anne).id), params: title_change

    end_count = Work.count

    start_count.must_equal end_count

    updated_work = Work.find(works(:anne).id)
    updated_work.title.must_equal title_change[:work][:title]
  end


  # it "should create a new vote when successfully upvoted" do
  #   post movies_path, params: { work:
  #     {  title: "This is a title",
  #       category: "movie"
  #     }
  #   }
  #   post login_path, session: {
  #      name: "jackie"
  #     }
  #
  #   start_count = Vote.count
  #   post upvote_path, params: {  title: "This is a title",
  #     category: "movie",
  #     user_id: params[:name].id
  #   }
  #
  #   end_count = Vote.count
  #   must_redirect_to :back
  #
  # (end_count - start_count).must_equal 1
  #
  # end

end
