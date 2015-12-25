class PhotoPostsController < ApplicationController

  def index
    @photo_posts = PhotoPost.all
  end

  def show
    @photo_post = PhotoPost.find(params[:id])
  end

end
