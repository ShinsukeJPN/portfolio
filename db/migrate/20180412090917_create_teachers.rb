class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.integer :user_id
      t.integer :language_teacher_id
      t.integer :budget
      t.integer :japanese_level
      t.text :message
      t.integer :first_language

      t.timestamps
    end
  end
end
