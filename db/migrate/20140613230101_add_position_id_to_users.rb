class AddPositionIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position_id, :integer
    add_index :users, :position_id
  end
end
