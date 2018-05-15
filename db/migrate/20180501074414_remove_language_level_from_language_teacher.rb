class RemoveLanguageLevelFromLanguageTeacher < ActiveRecord::Migration[5.1]
  def change
  	remove_column :language_teachers, :language_level, :integer
  end
end
