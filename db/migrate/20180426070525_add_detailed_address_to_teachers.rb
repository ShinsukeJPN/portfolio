class AddDetailedAddressToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :detailed_address_1, :string
    add_column :teachers, :detailed_address_2, :string
    add_column :teachers, :detailed_address_3, :string
  end
end
