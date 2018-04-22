class RemoveReceiverUserIdFromMessage < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :receiver_user_id, :integer
  end
end
