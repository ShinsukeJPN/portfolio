class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.text :detailed_place
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end
end
