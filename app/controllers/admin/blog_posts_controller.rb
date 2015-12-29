class Admin::BlogPostsController < Admin::DashboardController
  before_action :authorize_user
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = current_user.blog_posts.new
  end

  def create
    @blog_post = current_user.blog_posts.create!(blog_params)
    flash[:notice] = "Blog Post Created"
    redirect_to admin_blog_posts_url
  end

  def edit
  end

  def update
    if @blog_post.update(blog_params)
      flash[:notice] = "Blog Post Updated"
      redirect_to admin_blog_posts_url
    end
  end

  def destroy
    @blog_post.destroy!
    flash[:notice] = "Blog Post Deleted"
    redirect_to admin_blog_posts_url
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_params
      params.require(:blog_post).permit(:title, :body, :status, :feature_image, :author, :all_tags)
    end
end
