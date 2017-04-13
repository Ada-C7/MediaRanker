require "test_helper"

describe WorksController do
  describe "WorksControllerTest" do
      it "should get show" do
        get work_path(works(:lee).id)
        must_respond_with :success
      end

      it "should show a 404 when work is not found" do
        get work_path(0)
        must_respond_with :missing
      end

      it "should redirect to book list after creating a book" do
        post works_path, params: { work:
          { category: "book",
            title: "Testing",
            creator: "someone",
            publication_year: "4444",
            description: "blah blah",
          }
        }
        must_redirect_to books_path
      end

      it "should redirect to album list after creating an album" do
        post works_path, params: { work:
          { category: "album",
            title: "Testing",
            creator: "someone",
            publication_year: "4444",
            description: "blah blah",
          }
        }
        must_redirect_to albums_path
      end

      it "should redirect to movie list after creating a movie" do
        post works_path, params: { work:
          { category: "movie",
            title: "Testing",
            creator: "someone",
            publication_year: "4444",
            description: "blah blah",
          }
        }
        must_redirect_to movies_path
      end

      it "should affect the model when creating a work" do
        proc {
          post works_path, params: { work:
            { category: "book",
              title: "Testing book",
              creator: "someone",
              publication_year: "4444",
              description: "blah blah",
            }
          }
        }.must_change 'Work.count', 1
      end

      it "delete an album and redirects to album list" do
        delete  work_path(works(:lee).id)
        must_redirect_to albums_path
      end

      it "should affect the model when deleting a work " do
        proc {
          delete  work_path(works(:lee).id)
        }.must_change 'Work.count', -1
      end

      it "should get edit page" do
        get edit_work_path(works(:lee).id)
        must_respond_with :success
      end

    end
end
