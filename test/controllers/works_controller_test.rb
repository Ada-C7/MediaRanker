require "test_helper"

describe WorksController do
  let(:work) { works :one }

  it "gets index" do
    Work.count.must_be :>, 0
    get works_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_work_url
    value(response).must_be :success?
  end

  it "creates work" do
    expect {
      post works_url, params: { work: { category: work.category, creator: work.creator, description: work.description, publication_year: work.publication_year, title: work.title, } }
    }.must_change "Work.count"

    must_redirect_to work_path(Work.last)
  end

  it "shows work" do
    work = Work.first
    get work_path(work)
    must_respond_with :success

    # get work_url(work)
    # value(response).must_be :success?
  end

  it "gets edit" do
    get edit_work_url(work)
    value(response).must_be :success?
  end

  it "updates work" do
    patch work_url(work), params: { work: { category: work.category, creator: work.creator, description: work.description, publication_year: work.publication_year, title: work.title,  } }
    must_redirect_to work_path(work)
  end

  # it "destroys work" do
  #   expect {
  #     delete work_url(work)
  #   }.must_change "Work.count", -1
  #
  #   must_redirect_to works_path
  # end

  it "returns a 404 if the work doesn't exist" do
    work_id = Work.last.id
    work_id += 1
    get work_path(work_id)
  end


end
