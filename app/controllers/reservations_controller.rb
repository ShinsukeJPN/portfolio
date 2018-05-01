class ReservationsController < ApplicationController
	def new
		@reservation = Reservation.new
	end

	def index
		@teacher_reservations = Reservation.where(teacher_id: current_user.id).where.not("reservations.time < ?", Time.now)
		@student_reservations = Reservation.where(student_id: current_user.id).where.not("reservations.time < ?", Time.now)
		@ws_finished_reservations = Reservation.where("reservations.time < ?", Time.now).where(teacher_id: current_user)
		@wt_finished_reservations = Reservation.where("reservations.time < ?", Time.now).where(student_id: current_user)
		@report = Report.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.save
		redirect_to user_reservations_path(current_user)
	end

	def edit
		@reseravtion = Reservation.find(params[:id])
	end

	def update
	end

	def destroy

	end

	private
	def reservation_params
		params.require(:reservation).permit(:date, :time, :detailed_place, :teacher_id, :student_id, :status)
	end
end