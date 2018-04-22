class CreateLanguageStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :language_students do |t|
      t.integer :student_id
      t.integer :language_id
      t.integer :language_level

      t.timestamps
    end
  end
end
