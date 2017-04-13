class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
