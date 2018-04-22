class ChangeFirstLanguageToStudent < ActiveRecord::Migration[5.1]
  def up
  	change_column :students, :first_language, :string
  end
  def down
  	change_column :students, :first_language, :integer
  end
end
