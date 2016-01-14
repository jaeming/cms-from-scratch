class Admin::NavigationsController < ApplicationController
  before_filter :authorize_admin
  before_action :set_navigation, only: [:show, :edit, :update, :destroy]

  def index
    @navigations = Navigation.all
  end

  def show
  end

  def new
    @navigation = Navigation.new
  end

  def create
    @navigation = Navigation.create!(nav_params)
    Navigation.reorder_links(:desc)
    redirect_to admin_navigations_url
  end

  def edit
  end

  def update
    prev_order = @navigation.order
    proposed_order = nav_params[:order]
    @navigation.update!(nav_params)
    Navigation.reorder_by_direction(prev_order, proposed_order)
    redirect_to admin_navigations_url
  end

  def destroy
    @navigation.destroy!
    Navigation.reorder_links(:asc)
    redirect_to admin_navigations_url
  end

  private
    def set_navigation
      @navigation = Navigation.find(params[:id])
    end

    def nav_params
      params.require(:navigation).permit(:title, :link, :order, :new_tab)
    end

end
