class ChangeTimeToReservation < ActiveRecord::Migration[5.1]
  def up
  	change_column :reservations, :time, :datetime
  end
  def down
  	change_column :reservations, :time, :time
  end
end
