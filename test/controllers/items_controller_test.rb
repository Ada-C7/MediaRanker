require "test_helper"

describe ItemsController do

    describe "index" do
      it "is successful when there are many items" do
        Item.count.must_be :>, 0
        get items_path
        must_respond_with :success
      end

      it "is successful when there are zero items" do
        Item.destroy_all
        get items_path
        must_respond_with :success
      end
    end

end
