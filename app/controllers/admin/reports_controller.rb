class Admin::ReportsController < ApplicationController
	def index
		@reports = Report.all
	end

	def destroy
		@report = Report.find(params[:id])
		@report.destroy
		redirect_to admin_reports_path, flash: {delreport: "報告を１件削除しました"}
	end
end