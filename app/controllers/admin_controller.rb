class AdminController < ApplicationController
  # before_action :require_login
  before_action :authorize_admin

  def index
    @content_types = ContentType.all
  end

  def show
    @content_types = ContentType.all
    @content = ContentType.find(params[:id])
  end

  def new
    content_type_id = request.path.split('.')[1]
    @content_types = ContentType.all
    @content = ContentType.find(content_type_id)
    @entry = @content.entries.new
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :body)
    end

end
