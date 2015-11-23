class EntriesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  respond_to :html, :js

  def index
    if params[:tag]
      @entries = Entry.tagged_with(params[:tag])
      flash[:notice] = "Sorry, there are no tags for that topic" if @entries.blank?
    else
      @entries = Entry.all
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.create!(entry_params)
    respond_with do |format|
      format.html { redirect_to root_path }
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
    params.require(:entry).permit(:title, :body, :status, :feature_image, :author, :all_tags, :content_type_id)
  end
end
