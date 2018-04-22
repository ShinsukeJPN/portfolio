class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :send_user_id
      t.integer :receiver_user_id
      t.text :comment

      t.timestamps
    end
  end
end
