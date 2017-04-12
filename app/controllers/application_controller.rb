class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404
    render file: "#{ Rails.root }/public/404.html",
    status: 404
  end

  private

  def work_params
    params.require(:work).permit(:category, :name, :created_by, :pub_year, :desc)
  end
  
end
