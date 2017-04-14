require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
    describe WorksController do
        let(:work) {works(:antonia)}
        it "should get index" do
            get works_path
            must_respond_with :success
        end

        it "should get show" do
            get work_path(works(:antonia))
            must_respond_with :success
        end

        it "should delete an object" do
            proc { delete work_path(works(:antonia))}.must_change 'Work.count', -1
        end
    end
end
