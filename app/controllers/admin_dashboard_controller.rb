class AdminDashboardController < ApplicationController
  # before_action :require_login
  before_action :authorize_admin

  def index
    @content_types = ContentType.all
  end

end
