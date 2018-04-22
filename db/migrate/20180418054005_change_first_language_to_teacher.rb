class ChangeFirstLanguageToTeacher < ActiveRecord::Migration[5.1]
  def up
  	change_column :teachers, :first_language, :string
  end
  def down
  	change_column :teachers, :first_language, :integer
  end
end
