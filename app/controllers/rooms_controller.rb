class RoomsController < ApplicationController

	def index
		@with_teacher = Room.where(student_id: current_user)
		@with_student = Room.where(teacher_id: current_user)
	end

	def create
		@room = Room.new(room_params)
		@room.save
		request = Request.find(params[:request])
		request.delete
		redirect_to room_messages_path(@room)
	end

	private
	def room_params
		params.require(:room).permit(:send_user_id, :receiver_user_id, :teacher_id, :student_id)
	end
end