class AddDetailedPlaceToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :detailed_place_1, :string
    add_column :teachers, :detailed_place_2, :string
    add_column :teachers, :detailed_place_3, :string
    add_column :teachers, :need_to_bring, :string
    add_column :teachers, :background, :string
    end
end