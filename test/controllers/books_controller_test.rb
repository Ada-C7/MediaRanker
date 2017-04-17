require "test_helper"

describe BooksController do
  let(:work) {works(:my_book)}

  it "should get form for new" do
        get new_book_path(work.id)
        must_respond_with :success
      end

   it "should show the new books form" do
     get new_book_path
     must_respond_with :success
   end

   it "should redirect to book list after adding book" do
     post works_path, params: { work:
     { category: "book",
       title: work.title
       }
     }
     must_redirect_to books_path

   end

end
