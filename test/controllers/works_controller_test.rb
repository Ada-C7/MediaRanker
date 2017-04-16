require "test_helper"

describe WorksController do
  it "should get show" do
    get work_path(works(:lee).id)
    must_respond_with :success
  end

  it "should show a 404 when work is not found" do
    get work_path(0)
    must_respond_with :missing
  end

  it "should get edit page for book" do
    get edit_work_path(works(:lee).id)
    must_respond_with :success
  end

  it "should get edit page for album" do
    get edit_work_path(works(:dan).id)
    must_respond_with :success
  end

  it "should get edit page for movie" do
    get edit_work_path(works(:mee).id)
    must_respond_with :success
  end

  it "should update a book" do
    put work_path(works(:lee).id), params: {work:
      { category: "book",
        title: "Testing Update",
        creator: "Lee",
        publication_year: "4444",
        description: "blah blah"
      }
    }
    work = Work.find_by_id(works(:lee).id)
    work.category.must_equal "book"
    work.title.must_equal "Testing Update"
    work.creator.must_equal "Lee"
    work.publication_year.must_equal "4444"
    work.description.must_equal "blah blah"

    must_respond_with :redirect
    must_redirect_to books_path
  end

  it "should update an album" do
    put work_path(works(:dan).id), params: {work:
      { category: "album",
        title: "Testing Update",
        creator: "Lee",
        publication_year: "5555",
        description: "blah blah"
      }
    }

    work = Work.find_by_id(works(:dan).id)
    work.category.must_equal "album"
    work.title.must_equal "Testing Update"
    work.creator.must_equal "Lee"
    work.publication_year.must_equal "5555"
    work.description.must_equal "blah blah"
    must_respond_with :redirect
    must_redirect_to albums_path
  end

  it "should update movie" do
    put work_path(works(:mee).id), params: {work:
      { category: "movie",
        title: "Testing Update",
        creator: "Lee",
        publication_year: "6666",
        description: "blah blah"
      }
    }
    work = Work.find_by_id(works(:mee).id)
    work.category.must_equal "movie"
    work.title.must_equal "Testing Update"
    work.creator.must_equal "Lee"
    work.publication_year.must_equal "6666"
    work.description.must_equal "blah blah"
    must_respond_with :redirect
    must_redirect_to movies_path
  end


  it "should create a book" do
    post works_path, params: { work:
      { category: "book",
        title: "Testing",
        creator: "someone",
        publication_year: "4444",
        description: "blah blah"
      }
    }
    must_respond_with :redirect
    must_redirect_to books_path
  end

  it "should create an album" do
    post works_path, params: { work:
      { category: "album",
        title: "Testing",
        creator: "someone",
        publication_year: "4444",
        description: "blah blah"
      }
    }
    must_respond_with :redirect
    must_redirect_to albums_path
  end

  it "should create a movie" do
    post works_path, params: { work:
      { category: "movie",
        title: "Testing",
        creator: "someone",
        publication_year: "4444",
        description: "blah blah"
      }
    }
    must_respond_with :redirect
    must_redirect_to movies_path
  end

  it "should affect the model when creating a work" do
    proc {
      post works_path, params: { work:
        { category: "book",
          title: "Testing book",
          creator: "someone",
          publication_year: "4444",
          description: "blah blah"
        }
      }
    }.must_change 'Work.count', 1
  end

  it "should affect the model when deleting a work " do
    proc {
      delete  work_path(works(:lee).id)
    }.must_change 'Work.count', -1
  end

  it "delete an album and redirects to album list" do
    delete  work_path(works(:dan).id)
    must_respond_with :redirect
    must_redirect_to albums_path
  end

  it "delete a book and redirects to book list" do
    delete work_path(works(:lee).id)
    must_respond_with :redirect
    must_redirect_to books_path
  end

  it "delete an movie and redirects to movie list" do
    delete work_path(works(:mee).id)
    must_respond_with :redirect
    must_redirect_to movies_path
  end
end
