class PagesController < ApplicationController
  before_action :authorize_admin, only: [:create, :update, :edit, :destroy]
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
      redirect_to pages_url
    end
  end

  def update
    if @page.update(page_params)
      flash[:notice] = "Page Updated"
      redirect_to page_url
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Page Deleted"
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :body, :keywords, :all_tags)
    end
end
