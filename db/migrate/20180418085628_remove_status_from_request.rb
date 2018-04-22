class RemoveStatusFromRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :status, :integer
  end
end
