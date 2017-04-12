class WelcomeController < ApplicationController
  def index
    @works = Work.all
    @spotlight = Work.spotlight
  end

end
