class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_admin

  def show
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to admin_user_path(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

		def user_params
			require(:user).permit(:name, :avatar)
		end
end
