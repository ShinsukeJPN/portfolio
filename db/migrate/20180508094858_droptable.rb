class Droptable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :favorites
  end
end
