class RemoveUserIdFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :user_id
  end
end
