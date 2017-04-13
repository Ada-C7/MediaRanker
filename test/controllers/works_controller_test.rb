require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
    describe WorksController do
        let(:work) {works(:antonia)}
        it "should get index" do
            get works_path
            must_respond_with :success
        end
    end
end
