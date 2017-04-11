class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show_category
    works = Work.all
    @category_works = []
    works.each do |work|
      if work.category = params[:category]
        @category_works << work
      end
    end
    # return @category_works
    puts "WOO"
  end
end
