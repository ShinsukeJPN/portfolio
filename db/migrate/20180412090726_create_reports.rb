class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.text :report_comment
      t.integer :report_reason
      t.integer :user_id

      t.timestamps
    end
  end
end
