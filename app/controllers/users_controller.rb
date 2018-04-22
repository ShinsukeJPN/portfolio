class UsersController < ApplicationController
	# before_action :authenticate_user!

	def edit
		if params[:id]
			@user = User.find(params[:id])
		else
			@user = User.new
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user)
		# binding.pry
	end


	def show
		@user = User.find(params[:id])
		@info = @user.nickname || @user.nationality || @user.age || @user.gender
		# binding.pry
	end


	private
	def user_params
		params.require(:user).permit(:nickname, :nationality, :age, :gender, :image)
	end

	def authenticate_user!
		redirect_to root_path
		# unless admin_signed_in?
	end
end
