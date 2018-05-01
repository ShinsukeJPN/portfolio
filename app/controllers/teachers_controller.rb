class TeachersController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def new
		@user = User.find(params[:user_id])
		if (@user.nickname) && (@user.image).presents?
			@teacher = Teacher.new
			@teacher.language_teachers.build
		else
			redirect_to edit_user_path(current_user), flash: {notice: "すべてのユーザ情報を登録してください"}
		end
	end

	def index
		@request_t = Request.new
		@teachers = Teacher.where.not(id: current_user)
	end

	def create
		@user = current_user
		@teacher = Teacher.new(teacher_params)
		@teacher.save
		redirect_to teacher_path(current_user)
	end

	def show
		if Teacher.exists?(id: params[:id])
			@teacher = Teacher.find(params[:id])
		end
	end

	def edit
		@user = current_user
		@teacher = Teacher.find(params[:id])
	end

	def update
		@teacher = Teacher.find(params[:id])
		@teacher.update(teacher_params)
		redirect_to teacher_path(@teacher)
	end

	private

	def teacher_params
		params.require(:teacher).permit(:user_id, :budget, :japanese_level, :first_language, :message,
										language_teachers_attributes: [:id, :language_level, :language_id])
	end

end
