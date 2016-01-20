class Admin::NavigationsController < Admin::DashboardController
  before_filter :authorize_admin
  before_action :set_navigation, only: [:show, :edit, :update, :destroy]

  def index
    @navigations = Navigation.all
  end

  def show
  end

  def new
    @navigation = Navigation.new
    @pages = Page.all
  end

  def create
    if is_number? params[:link]
      page = Page.find(params[:link])
      link = page_url(page)
      @navigation = Navigation.create!(nav_params.except(:link).merge(link: link))
    else
      @navigation = Navigation.create!(nav_params)
    end
    Navigation.reorder_links(:desc)
    redirect_to admin_settings_url
  end

  def edit
    @pages = Page.all
  end

  def update
    prev_order = @navigation.order
    proposed_order = nav_params[:order]
    if is_number? params[:link]
      page = Page.find(params[:link])
      link = page_url(page)
      @navigation.update!(nav_params.except(:link).merge(link: link))
    else
      @navigation.update!(nav_params)
    end
    Navigation.reorder_by_direction(prev_order, proposed_order)
    redirect_to admin_settings_url
  end

  def destroy
    @navigation.destroy!
    Navigation.reorder_links(:asc)
    redirect_to admin_settings_url
  end

  private
    def set_navigation
      @navigation = Navigation.find(params[:id])
    end

    def nav_params
      params.require(:navigation).permit(:title, :link, :order, :new_tab)
    end

end
