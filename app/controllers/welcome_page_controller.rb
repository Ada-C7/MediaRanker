class WelcomePageController < ApplicationController
  def index
    @works = Work.all
  end
end
