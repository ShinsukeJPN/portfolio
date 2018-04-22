class TeachersController < ApplicationController
	def new
		@teacher = Teacher.new
	end

	def index
		@request = Request.new
		@teachers = Teacher.all
	end

	def create
		@user = current_user
		@teacher = Teacher.new(teacher_params)
		@teacher.save
		redirect_to teacher_path(@teacher)
	end

	def show
		@user = current_user
		@teacher = Teacher.find(params[:id])
		@info = @teacher.budget || @teacher.japanese_level
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
		params.require(:teacher).permit(:user_id, :budget, :japanese_level, :first_language, :message)
	end

end
