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
    get new_work_path(album.id)
    must_respond_with :success
  end

  it "should get edit work page" do
    get edit_work_path
    must_respond_with :success
  end

  it "should get work show page" do
    get work_path
    must_respond_with :success
  end

  it "should return 404 error if work not found" do
    
  end

  it "should get books category page" do

  end

  it "should get albums category page" do

  end

  it "shoudl get movies category page" do

  end
end
