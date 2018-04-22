class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :send_user_id
      t.integer :receiver_user_id

      t.timestamps
    end
  end
end
