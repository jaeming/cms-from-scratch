class Admin::PagesController < Admin::DashboardController
  before_action :authorize_admin
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_navigation, only: [:update, :destroy]

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
      Navigation.create!(
        title: @page.title,
        link: page_url(@page),
        order: ((Navigation.all.size) +1),
        new_tab: false
      )
      flash[:notice] = "Page Created"
      redirect_to admin_pages_url
    end
  end

  def update
    if @page.update(page_params)
      @navigation.update(title: @page.title, link: page_url(@page)) if @navigation
      flash[:notice] = "Page Updated"
      redirect_to admin_pages_url
    end
  end

  def destroy
    @page.destroy!
    @navigation.destroy if @navigation
    flash[:notice] = "Page Deleted, navigation-link removed."
    redirect_to admin_pages_url
  end

  private

    def set_page
      @page = Page.find(params[:id])
    end

    def set_navigation
      @navigation = Navigation.find_by(link: page_url(@page))
    end

    def page_params
      params.require(:page).permit(:title, :body, :keywords, :all_tags, :draft)
    end
end
