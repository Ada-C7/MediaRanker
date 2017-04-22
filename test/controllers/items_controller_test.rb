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

  describe "index_by_category" do
    it "is successful when a category has items" do
      Item.where(category:"book").count.must_be :>, 0
      get category_index_path(:book)
      must_respond_with :success
    end

    it "is successful when a category has no items" do
    # This case also will cover as yet unused categories
      Item.destroy_all
      get category_index_path(:book)
      must_respond_with :success
    end
  end

  describe "new" do
    it "runs successfully" do
      get new_item_by_category_path(:book)
      must_respond_with :success
    end
  end

end
