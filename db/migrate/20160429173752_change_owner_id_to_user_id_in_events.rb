class ChangeOwnerIdToUserIdInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :owner_id, :user_id
  end
end
