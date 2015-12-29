class Admin::PhotoPostsController < Admin::DashboardController
  before_action :authorize_user
  before_action :set_photo_post, only: [:show, :edit, :update, :destroy]

  def index
    @photo_posts = PhotoPost.all
  end

  def show
  end

  def new
    @photo_post = current_user.photo_posts.new
  end

  def edit
  end

  def create
    @photo_post = current_user.photo_posts.create!(photo_post_params)
    flash[:notice] = "Photo Post Created"
    redirect_to admin_photo_posts_url
  end

  def update
    @photo_post.update!(photo_post_params)
    flash[:notice] = "Photo Post Updated"
    redirect_to admin_photo_posts_url
  end

  def destroy
    @photo_post.destroy!
    flash[:notice] = "Photo Post Destroyed"
    redirect_to admin_photo_posts_url
  end

  private
    def set_photo_post
      @photo_post = PhotoPost.find(params[:id])
    end

    def photo_post_params
      params.require(:photo_post).permit(:image, :description, :title, :published, :references)
    end
end
