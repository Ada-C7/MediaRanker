require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  describe WorksController do
    it "should get index" do
      get(works_path) #should we respond with a missing code?
      must_respond_with :success #:error, :missing, :redirect
    end

    #     it "should display one book/details" do
    #       get(book_path(books(:poodr).id))
    #       must_respond_with :success
    #     end
    #
    #     it "should display 404 when book not found" do
    #       get book_path(1)
    #       must_respond_with :missing
    #     end
    #
    #     it "should show the new book form" do
    #       get new_book_path
    #       must_respond_with :success
    #     end
    #
    #     it "should redirect to list after adding book" do
    #       post books_path, params: { book:
    #         { title: "Testing",
    #           author_id: authors(:metz).id,
    #           description: "ya hai",
    #           isbn: rand(10..50) } }
    #
    #       must_redirect_to books_path
    #     end
    #
    #     it "should affect the model when creating a book" do
    #       proc {
    #         post books_path, params: { book:
    #           { title: "Testing",
    #             author_id: authors(:metz).id,
    #             description: "ya hai",
    #             isbn: rand(10..50) } }
    #           }.must_change "Book.count", 1
    #     end
    #
    #     it "should delete a book and redirect to book list" do
    #       delete book_path(books(:poodr).id)
    #       must_redirect_to books_path
    #     end
    # 
  end
end
