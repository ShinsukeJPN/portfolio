class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :user_id
      t.integer :language_student_id
      t.integer :budget
      t.text :message
      t.integer :first_language

      t.timestamps
    end
  end
end
