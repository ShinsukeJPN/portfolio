class ReservationsController < ApplicationController
	def new
		@reservation = Reservation.new
	end

	def index
		@teacher_reservations = Reservation.where(teacher_id: current_user).where("reservations.reservation_date > ?", Time.now)
		@student_reservations = Reservation.where(student_id: current_user).where("reservations.reservation_date > ?", Time.now)
		@ws_finished_reservations = Reservation.where("reservations.reservation_date < ?", Time.now).where(teacher_id: current_user)
		@wt_finished_reservations = Reservation.where("reservations.reservation_date < ?", Time.now).where(student_id: current_user)
		@report = Report.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.save
		redirect_to user_reservations_path(current_user)
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		@reservation.update(reservation_params)
		redirect_to user_reservations_path(current_user)
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to user_reservations_path(current_user)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:reservation_time, :reservation_date, :detailed_place, :teacher_id, :student_id, :status)
	end
end