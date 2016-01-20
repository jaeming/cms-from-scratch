class Admin::UsersController < Admin::DashboardController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to admin_user_path(@user)
  end

  def destroy
    unless current_user == @user
      @user.destroy!
      flash[:notice] = "User Deleted"
    else
      flash[:error] = "You cannot delete yourself"
    end
    redirect_to admin_users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

		def user_params
			params.require(:user).permit(:name, :avatar, :password)
		end
end
