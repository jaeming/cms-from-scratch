class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    respond_to do |format|
      if @entry.save
        format.js
      else
        format.html { render root_path }
      end
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    @entry.update!(entry_params)
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy!
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :body, :status, :feature_image, :author, :all_tags)
  end
end
