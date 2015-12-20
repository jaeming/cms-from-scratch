class Admin::PagesController < ApplicationController
  before_action :require_login
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page Created"
      redirect_to admin_pages_url
    end
  end

  def update
    if @page.update(page_params)
      flash[:notice] = "Page Updated"
      redirect_to admin_pages_url
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Page Deleted"
    redirect_to admin_pages_url
  end

  private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :body, :keywords, :all_tags)
    end
end
