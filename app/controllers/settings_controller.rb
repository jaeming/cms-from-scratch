class SettingsController < ApplicationController

  def show
    authorize_admin
    @setting = Setting.first_or_create!
  end

  def update
    authorize_admin
    @setting = Setting.first_or_create!
    @setting.update!(setting_params)
  end

  private
  def setting_params
    params.require(:setting).permit(:comments_approval, :comments_only_registered, :new_user_signups, :site_title, :site_description, :timezone)
  end
end
