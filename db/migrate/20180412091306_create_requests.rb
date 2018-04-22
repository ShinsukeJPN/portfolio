class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.integer :receiver_id
      t.integer :status

      t.timestamps
    end
  end
end
