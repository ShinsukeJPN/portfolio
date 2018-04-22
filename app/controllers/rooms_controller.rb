class RoomsController < ApplicationController

	def index
		@with_teacher = Room.where(student_id: current_user.id)
		@with_student = Room.where(teacher_id: current_user.id)
	end

	def create
		@room = Room.new(room_params)
		@room.save
		redirect_to user_rooms_path(current_user)
	end

	private
	def room_params
		params.require(:room).permit(:send_user_id, :receiver_user_id, :teacher_id, :student_id)
	end
end



