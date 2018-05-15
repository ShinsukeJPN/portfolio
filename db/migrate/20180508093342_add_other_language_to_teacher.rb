class AddOtherLanguageToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :other_language, :string
  end
end
