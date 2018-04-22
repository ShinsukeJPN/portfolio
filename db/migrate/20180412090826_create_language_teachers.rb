class CreateLanguageTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :language_teachers do |t|
      t.integer :teacher_id
      t.integer :language_id
      t.integer :language_level

      t.timestamps
    end
  end
end
