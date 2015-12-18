class PagesController < ApplicationController

  def index
    @pages = Page.published
  end

  def show
    @page = Page.find(params[:id])
  end

end
