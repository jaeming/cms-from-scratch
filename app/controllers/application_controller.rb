class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_admin
    permission_denied unless current_user && current_user.role == "admin"
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end

end
