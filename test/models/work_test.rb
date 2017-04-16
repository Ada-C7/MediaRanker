require "test_helper"

describe Work do
  let(:work) { Work.create!(title: "Lau") }
  let(:work_no_title) { Work.create }
  let(:work_blank) { Work.create(title: " ")}

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "Do not let create a new work without a title" do
    work_no_title.valid?.must_equal false
  end

  it "Requires presence of title" do
    work_blank.valid?.must_equal false
  end

  it "title should be unique" do
    w = work
    w1 = Work.new(title: "Lau")
    w1.valid?.must_equal false
  end
end
