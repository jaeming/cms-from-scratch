class Admin::Galleries::PhotoPostsController < Admin::DashboardController
  before_action :authorize_user

  def show
    @gallery = Gallery.find(params[:gallery_id])
    @photo_post = PhotoPost.find(params[:id])
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @photo_post = current_user.photo_posts.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @photo_post = PhotoPost.find(params[:id])
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo_post = current_user.photo_posts.new(photo_post_params)
    @photo_post.gallery = @gallery
    @photo_post.save!
    flash[:notice] = "Photo Post Created"
    redirect_to admin_gallery_url(@gallery)
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @photo_post = PhotoPost.find(params[:id])
    @photo_post.update!(photo_post_params)
    flash[:notice] = "Photo Post Updated"
    redirect_to admin_gallery_url(@gallery)
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @photo_post = PhotoPost.find(params[:id])
    @photo_post.destroy!
    flash[:notice] = "Photo Post Destroyed"
    redirect_to admin_gallery_url(@gallery)
  end

  private

    def photo_post_params
      params.require(:photo_post).permit(:image, :description, :title, :published, :references)
    end
end
