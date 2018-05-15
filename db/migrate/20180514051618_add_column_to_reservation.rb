class AddColumnToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :reservation_date, :date
    add_column :reservations, :reservation_time, :reservation_time
  end
end
