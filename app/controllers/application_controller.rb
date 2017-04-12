class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def category_params
    #maybe this will go in the action controller
    params.require(:category).permit(:title, :creator, :publication_year, :description)
  end
end
