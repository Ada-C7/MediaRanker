class MediaRankerController < ApplicationController

  def index
    @works = Work.all
  end
end
