require "test_helper"

describe AlbumsController do
  let(:work) {works(:my_book)}

  it "should get form for new" do
        get new_album_path(work.id)
        must_respond_with :success
      end

   it "should show the new albums form" do
     get new_album_path
     must_respond_with :success
   end

   it "should redirect to album list after adding album" do
     post works_path, params: { work:
     { category: "album",
       title: work.title
       }
     }
     must_redirect_to albums_path

   end
end
