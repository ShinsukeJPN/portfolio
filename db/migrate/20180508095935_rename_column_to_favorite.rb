class RenameColumnToFavorite < ActiveRecord::Migration[5.1]
  def change
  	rename_column :favorites, :send_user_id, :student_id
  	rename_column :favorites, :receive_user_id, :teacher_id
  end
end
