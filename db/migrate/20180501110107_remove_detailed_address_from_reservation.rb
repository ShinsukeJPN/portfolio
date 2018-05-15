class RemoveDetailedAddressFromReservation < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :detailed_address, :string
  end
end
