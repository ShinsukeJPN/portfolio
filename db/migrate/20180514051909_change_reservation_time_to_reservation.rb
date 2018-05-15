class ChangeReservationTimeToReservation < ActiveRecord::Migration[5.1]
  def up
  	change_column :reservations, :reservation_time, :time
  end

  def down
  	change_column :reservations, :reservation_time, :reservation_time
  end
end
