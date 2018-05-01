class UsersController < ApplicationController
	# before_action :authenticate_user!
	def edit
			@user = User.find(params[:id])
			@user.user_areas.build
	end

	def update
		@user = User.find(params[:id])
		# areas = params[:user][:user_areas][:area_id]
		@user.update(user_params)

		# areas.each do |area|
		# 	user_area = @user.user_areas.new
		#      user_area.area_id = area
  #               user_area.save
		# end
		redirect_to user_path(current_user)
		# binding.pry
	end


	def show
		@user = User.find(params[:id])
	end


	private
	def user_params
		params.require(:user).permit(
									:nickname,
									:nationality,
									:age,
									:gender,
									:image,
									user_areas_attributes: [:id, :area_id, :user_id]
									)
	end

	def authenticate_user!
		redirect_to root_path
		# unless admin_signed_in?
	end
end
