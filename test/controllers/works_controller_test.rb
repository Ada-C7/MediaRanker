require "test_helper"

describe WorksController do
  describe "index" do
    it "responds succesfully" do
      Work.count.must_be :>, 0
      get list_works_path("movies")
      must_respond_with :success
    end

    it "still responds successfully when there are no works." do
      Work.destroy_all
      get list_works_path("movies")
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds a work to the database" do
      work_data = { work: {title: "test book", category: "movie", publication_year: 2000 } }
      post works_path, params: work_data
      must_redirect_to list_works_path("movies")
    end

    it "re-renders the new work form if the work is invalid" do
      work_data = { work: { title: "test work"}}
      post works_path, params: work_data
      must_respond_with :bad_request
    end
  end
#
#   describe "show" do
#     it "shows a work that exists" do
#       book = Book.first
#       get book_path(book.id)
#       must_respond_with :success
#     end
#
#     it "returns a 404 not found status when asked for a book that doesn't exist" do
#       book_id = Book.last.id
#       book_id += 1
#       get book_path(book_id)
#       must_respond_with :not_found
#     end
#   end
# end
# require 'test_helper'
#
# class BooksControllerTest < ActionDispatch::IntegrationTest
#   describe "index" do
#     it "responds succesfully" do
#       Book.count.must_be :>, 0
#       get books_path
#       must_respond_with :success
#     end
#
#     it "still responds successfully when there are no books." do
#       Book.destroy_all
#       get books_path
#       must_respond_with :success
#     end
#   end
#
#
#   describe "new" do
#
#   end
#
#   describe "create" do
#     it "adds a book to the database" do
#       book_data = { book: {title: "test book", author_id: Author.first.id } }
#       post books_path, params: book_data
#       must_redirect_to books_path
#     end
#
#     it "re-renders the new book from if the book is invalid" do
#       book_data = { book: { title: "test book"}}
#       post books_path, params: book_data
#       must_respond_with :bad_request
#     end
#   end
#
#   describe "show" do
#     it "shows a book that exists" do
#       book = Book.first
#       get book_path(book.id)
#       must_respond_with :success
#     end
#
#     it "returns a 404 not found status when asked for a book that doesn't exist" do
#       book_id = Book.last.id
#       book_id += 1
#       get book_path(book_id)
#       must_respond_with :not_found
#     end
#   end

end
