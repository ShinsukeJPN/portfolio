class RemoveTimeFromReservation < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :time, :datetime
  end
end
