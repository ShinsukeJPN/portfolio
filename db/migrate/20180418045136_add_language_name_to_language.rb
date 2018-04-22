class AddLanguageNameToLanguage < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :language_name, :string
  end
end
