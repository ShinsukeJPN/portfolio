class AddAreaNameEngToArea < ActiveRecord::Migration[5.1]
  def change
    add_column :areas, :area_name_eng, :string
  end
end
