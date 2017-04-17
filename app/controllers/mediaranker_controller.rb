class MediarankerController < ApplicationController
  def index
    @works = Work.all
  end
end
