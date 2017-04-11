class WorksController < ApplicationController
  helper WorksHelper

  def index
    @works = Work.all
  end


  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
