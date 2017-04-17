require "test_helper"

describe BooksController do
  it "should get index" do
    get books_path
    must_respond_with :success
  end

  it "should show the new book form" do
    get new_book_path
    must_respond_with :success
  end


  it "should redirect to list of books when new book added" do
    post books_path, params: { work:
      { title: "Test",
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }

    must_redirect_to books_path
  end

  it "should affect the model after new book is added" do
    proc {
      post books_path, params: { work:
        { title: "Test",
          creator: "Blaa",
          publication_year: 1145,
          description: "Whatevs"
        } }
    }.must_change 'Work.count', 1
  end

  it "last work in the model should be new book" do
    book = { work:
      { title: "Testing book",
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }

    post books_path, params: book

    last_work = Work.last
    last_work.title.must_equal book[:work][:title]
    last_work.category.must_equal "book"
  end

  it "should not change model if invalid" do
    book = { work:
      {
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }
      start_count = Work.count

      post movies_path, params: book

      end_count = Work.count

      start_count.must_equal end_count
  end

end
