class AddSoftDestroyedAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :soft_destroyed_at, :datetime
  end
end