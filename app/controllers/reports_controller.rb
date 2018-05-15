class ReportsController < ApplicationController
	def create
		if params[:reservation].present?
			redirect_to user_reservations_path(current_user), flash: {reported:"すでにこのユーザを報告しています!"}
		else
		@report = Report.new(report_params)
		@report.save
		redirect_to user_reservations_path(current_user)
		end
	end

	def index
		@reports = Report.all
	end


	private
	def report_params
		params.require(:report).permit(:user_id, :reported_user_id, :report_comment, :report_reason)
	end
end
