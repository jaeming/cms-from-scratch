class Admin::GalleriesController < ApplicationController
  before_action :authorize_admin
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def create
    @gallery = Gallery.create!(gallery_params)
    redirect_to admin_galleries_url
  end

  def update
    @gallery.update!(gallery_params)
    redirect_to admin_galleries_url
  end

  def destroy
    @gallery.destroy!
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
