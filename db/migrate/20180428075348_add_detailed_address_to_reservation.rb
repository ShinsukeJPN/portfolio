class AddDetailedAddressToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :detailed_address, :string
  end
end
