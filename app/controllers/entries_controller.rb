class EntriesController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :body, :status, :feature_image, :author, :all_tags)
  end
end
