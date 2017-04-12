require "test_helper"

require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest

  describe WorksController do
      it 'should get index' do
        get works_path
        must_respond_with :success
      end

      it 'should get show' do
        get work_path(Work.first.id)
        must_respond_with :success
      end

      it 'should get show' do
        get work_path(works(:two).id)
        must_respond_with :success
      end


      it 'should show a 404 when work not found' do
        get work_path(1)
        must_respond_with :missing
      end

       it 'should show the new form' do
        skip
        get new_work_path
        must_respond_with :success
      end

      it 'should redirect to list after adding work' do
        skip
        post works_path, params: {work:
          { title: "Test",
            author_id: authors(:metz).id,
            description: "whatevs",
            isbn: rand(10..50)
            }} #must be structured in the same stucture the form is created in
        must_redirect_to works_path #this is what we are actually testing, but we need apporiate data to actually redirect
      end

      it "should affect the model when creating a work" do
        skip
      proc {
        post works_path, params: {work:
          { title: "Test",
            author_id: authors(:metz).id,
            description: "whatevs",
            isbn: rand(10..50)
            }}
          }.must_change 'Work.count', 1
      end


       it 'should delete a work and redirect to work list' do
        skip
        delete work_path(works(:two).id)
        must_redirect_to works_path
      end

       it 'should affect the model when deleting a work' do
        skip
        proc {
          delete work_path(works(:two).id)
        }.must_change 'Work.count', -1
      end


      it 'should get edit' do
        get work_path(Work.first.id)
        must_respond_with :success
      end

      it 'should get create' do
        skip
        post works_path
        must_respond_with :success
      end
  end

end
