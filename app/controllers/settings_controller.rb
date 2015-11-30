class SettingsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_or_initilize_settings

  def index
  end

  def show
  end

  def update
    @setting.update!(setting_params)
  end

  private
  def setting_params
    params.require(:setting).permit(:comments_approval, :comments_only_registered, :new_user_signups, :site_title, :site_description, :timezone)
  end

  def find_or_initilize_settings
    @setting = Setting.first_or_create!
  end
end
