class AddOtherLanguageToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :other_language, :string
  end
end
