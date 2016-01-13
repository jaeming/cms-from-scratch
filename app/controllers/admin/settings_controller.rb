class Admin::SettingsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_or_initilize_settings

  def index
    @navigations = Navigation.all
  end

  def show
  end

  def edit
  end

  def update
    @setting.update!(setting_params)
    redirect_to admin_settings_url
  end

  private
  def setting_params
    params.require(:setting).permit(:site_title, :site_description)
  end

  def find_or_initilize_settings
    @setting = Setting.first_or_create!
  end
end
