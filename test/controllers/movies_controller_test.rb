require "test_helper"

describe MoviesController do
  it "should get index" do
    get movies_path
    must_respond_with :success
  end

  it "should show the new movie form" do
    get new_movie_path
    must_respond_with :success
  end

  it "should redirect to list of movies when new movie added" do
    post movies_path, params: { work:
      { title: "Test",
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }

    must_redirect_to movies_path
  end

  it "should affect the model after new movie is added" do
    proc {
      post movies_path, params: { work:
        { title: "Test",
          creator: "Blaa",
          publication_year: 1145,
          description: "Whatevs"
        } }
    }.must_change 'Work.count', 1
  end

  it "last work in the model should be new movie" do
    movie = { work:
      { title: "Testing movie",
        creator: "Blaa",
        publication_year: 1145,
        description: "Whatevs"
      } }

    post movies_path, params: movie

    last_work = Work.last
    last_work.title.must_equal movie[:work][:title]
    last_work.category.must_equal "movie"
  end

  # it "should render new view if invalid movie entered" do
  #   movie = { work:
  #     {
  #       creator: "Blaa",
  #       publication_year: 1245,
  #       description: "Whatevs"
  #     } }
  #     post movies_path, params: movie
  #
  #     must_respond_with :error
  #
  #
  # end

it "should not change model if invalid" do
  movie = { work:
    {
      creator: "Blaa",
      publication_year: 1145,
      description: "Whatevs"
    } }
    start_count = Work.count

    post movies_path, params: movie

    end_count = Work.count

    start_count.must_equal end_count
end

end
