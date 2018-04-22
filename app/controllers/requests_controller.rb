class RequestsController < ApplicationController
	def create
		@request = Request.new(request_params)
		@request.save
		redirect_to user_requests_path(current_user)
	end

	def index
		@got = Request.where(student_id: current_user) || Request.where(teacher_id: current_user)
		@sent = Request.where(student_id: current_user)
		@room = Room.new
	end

	def update
		request = Request.find(params[:id])
		request.update(request_params)
		redirect_to user_requests_path(current_user)
	end

	def destroy
		request = Request.find(params[:id])
		request.delete
		redirect_to user_requests_path(current_user)
	end

	private
	def request_params
		params.require(:request).permit(:teacher_id, :student_id, :status)
	end
end

