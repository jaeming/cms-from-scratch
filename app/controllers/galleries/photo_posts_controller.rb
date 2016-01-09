class Galleries::PhotoPostsController < ApplicationController

  def show
    @photo_post = PhotoPost.find(params[:id])
  end

end
