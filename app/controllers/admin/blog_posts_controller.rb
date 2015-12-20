class Admin::BlogPostsController < ApplicationController
  before_action :require_login
  respond_to :html, :js

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post = BlogPost.create!(blog_params)
    flash[:notice] = "Blog Post Created"
    respond_with do |format|
      format.html { redirect_to admin_blog_posts_url }
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update!(blog_params)
  end

  def update
    if @page.update(page_params)
      flash[:notice] = "Blog Post Updated"
      redirect_to admin_blog_posts_url
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy!
    flash[:notice] = "Blog Post Deleted"    
    redirect_to admin_blog_posts_url
  end

  private
  def blog_params
    params.require(:blog_post).permit(:title, :body, :status, :feature_image, :author, :all_tags)
  end
end
