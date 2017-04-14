require "test_helper"

describe WorksController do
  let(:album) { works(:album) }
  let(:book) { works(:book) }
  let(:movie) { works(:movie) }

  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "should get new work page" do
    get new_work_path
    must_respond_with :success
  end
  #
  # it "should get edit work page" do
  #   get edit_work_path(album.id)
  #   must_respond_with :success
  # end
  #
  # it "should get work show page" do
  #   get work_path(album.id)
  #   must_respond_with :success
  # end
  #
  # it "should show a 404 error when work not found" do
  #   album.id = nil
  #   get work_path(album.id)
  #   must_respond_with :missing
  # end
  #
  # it "should get books category page" do
  #   get books_path
  #   must_respond_with :success
  # end
  #
  # it "should redierct books page after adding a new book" do
  #   post works_path, params: {
  #     book: {
  #       title: "New Book",
  #       creator: "Sandi",
  #       year: 1984,
  #       description: "A great book",
  #       category: "book"
  #     }
  #   }
  #   must_redirect_to books_path
  # end
  #
  # it "should affect the model when adding a new book" do
  #   proc {
  #     post works_path, params: {
  #       book: {
  #         title: "New Book",
  #         creator: "Sandi",
  #         year: 1984,
  #         description: "A great book",
  #         category: "book"
  #       }
  #     }
  #   }.must_change 'Work.count', 1
  # end
  #
  # it "should delete a book and rediect to the books page" do
  #   delete work_path(book.id)
  #   must_redirect_to books_path
  # end
  #
  # it "should get albums category page" do
  #   get albums_path
  #   must_respond_with :success
  # end
  #
  # it "should redierct to albums page after adding a new album" do
  #   post works_path, params: {
  #     album: {
  #       title: "New album",
  #       creator: "Sandi",
  #       year: 1984,
  #       description: "A great album",
  #       category: "album"
  #     }
  #   }
  #   must_redirect_to albums_path
  # end
  #
  # it "should affect the model when adding a new album" do
  #   proc {
  #     post works_path, params: {
  #       album: {
  #         title: "New album",
  #         creator: "Sandi",
  #         year: 1984,
  #         description: "A great album",
  #         category: "album"
  #       }
  #     }
  #   }.must_change 'Work.count', 1
  # end
  #
  # it "should delete a album and rediect to the albums page" do
  #   delete work_path(album.id)
  #   must_redirect_to albums_path
  # end
  #
  # it "should get movies category page" do
  #   get movies_path
  #   must_respond_with :success
  # end
  #
  # it "should redierct to movies page after adding a new movie" do
  #   post works_path, params: {
  #     movie: {
  #       title: "New movie",
  #       creator: "Sandi",
  #       year: 1984,
  #       description: "A great movie",
  #       category: "movie"
  #     }
  #   }
  #   must_redirect_to movies_path
  # end
  #
  # it "should affect the model when adding a new movie" do
  #   proc {
  #     post works_path, params: {
  #       movie: {
  #         title: "New movie",
  #         creator: "Sandi",
  #         year: 1984,
  #         description: "A great movie",
  #         category: "movie"
  #       }
  #     }
  #   }.must_change 'Work.count', 1
  #
  # end
  #
  # it "should delete a movie and rediect to the movies page" do
  #   delete work_path(movie.id)
  #   must_redirect_to movies_path
  # end
end
