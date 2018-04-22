class StudentsController < ApplicationController
	def new
		@user = current_user
		@student = Student.new
	end

	def create
		@user = current_user
		@student = Student.new(student_params)
		@student.save
		redirect_to student_path(@student)
	end

	def index
		@request = Request.new
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
		@info = @student.first_language || @student.budget
		# binding.pry
		# || @student.message
	end

	def edit
		@user = current_user
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		@student.update(student_params)
		redirect_to student_path(@student.id)
	end



	private
	def student_params
		params.require(:student).permit(:budget, :first_language, :message, :user_id)
	end
end