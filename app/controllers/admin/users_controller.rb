class Admin::UsersController < Admin::DashboardController
  before_action :set_user, only: [:update, :destroy]
  before_action :authorize_admin, only: [ :create, :destroy, :new]

  def index
    if admin?
      @users = User.all
    else
      @users = current_user
    end
  end

  def show
    if admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:notice] = "User Created"
    redirect_to admin_users_path
  end

  def edit
    if admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    if admin?
      @user.update!(user_params)
    else
      @user.update!(user_params.except(:role))
    end
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
			params.require(:user).permit(:name, :avatar, :password, :email, :role)
		end
end
