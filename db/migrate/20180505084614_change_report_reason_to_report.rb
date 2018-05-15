class ChangeReportReasonToReport < ActiveRecord::Migration[5.1]
  def up
  	change_column :reports, :report_reason, :string
  end
  def down
  	change_column :reports, :report_reason, :integer
  end
end
