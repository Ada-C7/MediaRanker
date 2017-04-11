require "test_helper"

describe WorksController do
  let(:work) { works(:one) }

  it "should get index" do
    get root_path
    must_respond_with :success
  end
end
