class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :send_user_id
      t.integer :receive_user_id

      t.timestamps
    end
  end
end
