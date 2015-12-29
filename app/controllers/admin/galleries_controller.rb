class Admin::GalleriesController < Admin::DashboardController
  before_action :authorize_user
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
  end

  def new
    @gallery = current_user.galleries.new
  end

  def edit
  end

  def create
    @gallery = current_user.galleries.create!(gallery_params)
    flash[:notice] = "Gallery Created"
    redirect_to admin_galleries_url
  end

  def update
    @gallery.update!(gallery_params)
    flash[:notice] = "Gallery Updated"
    redirect_to admin_galleries_url
  end

  def destroy
    @gallery.destroy!
    flash[:notice] = "Gallery Destroyed"
    redirect_to admin_galleries_url
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :description)
    end
end
