class SettingsController < ApplicationController
  def update
    @setting = Setting.first_or_create!
    @setting.update!(setting_params) if user.admin == 'true' #ToDo: make user persmissions...and users...
  end

  private
  def setting_params
    params.require(:setting).permit(:comments_approval, :comments_only_registered, :new_user_signups, :site_title, :site_description, :timezone)
  end
end
