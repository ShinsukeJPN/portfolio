class Admin::UsersController < ApplicationController
	def index
		@q = User.ransack(params[:q])
		if params[:q].present?
			@searches = @q.result
		else
			@searches = User.all
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		user = User.find(params[:id])
		# session[:user] = nil
		user.soft_destroy
		if admin_signed_in?
			redirect_to admin_users_path
		else
			redirect_to logout_path, flash: {deleted: "あなたのアカウントは報告を受け停止されています。"}
		# 	redirect_to destroy_user_session_path, method: :delete
		end
	end

	# 論理削除で退会させた人を復元させる
	def restore
		user = User.find(params[:id])
		user.restore
		redirect_to admin_users_path
	end



end
