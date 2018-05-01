class ChangeAreaNameToArea < ActiveRecord::Migration[5.1]
  def up
  		change_column :areas, :area_name, :string
  end

  def down
  	change_column :areas, :area_name, :integer
  end
end