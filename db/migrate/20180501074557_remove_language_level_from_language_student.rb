class RemoveLanguageLevelFromLanguageStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :language_students, :language_level, :integer
  end
end
