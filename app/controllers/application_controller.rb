class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin?
    current_user && current_user.role == "admin"
  end

  def contributor?
    current_user && current_user.role == "contributor"
  end

  def authorize_user
    unless admin? || contributor?
      return redirect_to sign_in_url
    end
  end

  def authorize_admin
    unless admin?
      return redirect_to sign_in_url
    end
  end

end
