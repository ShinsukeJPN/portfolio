class StudentsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def new
		@user = User.find(params[:user_id])
		if (@user.nickname) && (@user.image).presents?
			@student = Student.new
			@teacher.language_students.build
		else
			redirect_to edit_user_path(current_user), flash: {notice: "すべてのユーザ情報を登録してください"}
		end
	end

	def create
		@user = current_user
		@student = Student.new(student_params)
		@student.save
		redirect_to student_path(@student)
	end

	def index
		@request_s = Request.new
		@students = Student.where.not(id: current_user)
	end

	def show
		@user = current_user
		if Student.exists?(id: params[:id])
			@student = Student.find(params[:id])
			@info = @student.first_language || @student.budget
		end
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