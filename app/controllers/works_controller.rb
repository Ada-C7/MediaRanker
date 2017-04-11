class WorksController < ApplicationController
  def index
    @works = Work.all
    # .sort {|d1, d2| d1.id <=> d2.id}

  end

  def show
    @work=Work.find(params[:id])
  end

  def show_category
    @categorized_works = []
    @work = Work.all
    @work.each do |work|
      if work.category == params[:category].singularize
        @categorized_works << work
      end
    end
    return @categorized_works
  end
end
