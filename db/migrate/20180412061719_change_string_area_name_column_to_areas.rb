class ChangeStringAreaNameColumnToAreas < ActiveRecord::Migration[5.1]
  def change
  	change_column :areas, :area_name, :integer
  end
end
