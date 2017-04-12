require "test_helper"

describe MoviesController do
  let(:work) {works(:my_book)}

  it "should get form for new" do
        get new_movie_path(work.id)
        must_respond_with :success
      end

   it "should show the new movies form" do
     get new_movie_path
     must_respond_with :success
   end

   it "should redirect to movie list after adding movie" do
     post works_path, params: { work:
     { category: "movie",
       title: work.title
       }
     }
     must_redirect_to movies_path

   end

end
