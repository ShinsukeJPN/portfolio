class RemoveLanguageFromLanguage < ActiveRecord::Migration[5.1]
  def change
    remove_column :languages, :language, :integer
  end
end
