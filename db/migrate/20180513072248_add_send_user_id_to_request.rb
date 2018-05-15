class AddSendUserIdToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :send_user_id, :integer
  end
end
