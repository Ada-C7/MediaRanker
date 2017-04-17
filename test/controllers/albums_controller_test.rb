require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should show the new album form" do
    get new_album_path
    must_respond_with :success
  end

  it "should redirect to list of albums when new album added" do
    post albums_path, params: { work:
      { title: "Test",
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }

    must_redirect_to albums_path
  end

  it "should affect the model after new album is added" do
    proc {
      post albums_path, params: { work:
        { title: "Test",
          creator: "Blaa",
          publication_year: 1145,
          description: "Whatevs"
        } }
    }.must_change 'Work.count', 1
  end

  it "last work in the model should be new album" do
    album = { work:
      { title: "Testing album",
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }

    post albums_path, params: album

    last_work = Work.last
    last_work.title.must_equal album[:work][:title]
    last_work.category.must_equal "album"
  end

  it "should not change model if invalid" do
    album = { work:
      {
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }
      start_count = Work.count

      post movies_path, params: album

      end_count = Work.count

      start_count.must_equal end_count
  end


end
