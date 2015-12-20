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
    respond_with do |format|
      format.html { redirect_to root_path }
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update!(blog_params)
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy!
  end

  private
  def blog_params
    params.require(:blog_post).permit(:title, :body, :status, :feature_image, :author, :all_tags)
  end
end
