class ReportsController < ApplicationController
	def create
		@report = Report.new(report_params)
		@report.save
		redirect_to user_reservations_path(current_user)
	end

	private
	def report_params
		params.require(:report).permit(:user_id, :reported_user_id, :report_comment, :report_reason)
	end
end
