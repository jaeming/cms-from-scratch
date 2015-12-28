class Admin::UsersController < ApplicationController

  private
		def user_params
			require(:user).permit(:avatar)
		end
end