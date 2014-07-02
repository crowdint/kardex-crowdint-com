class AddNomineeListIndexes < ActiveRecord::Migration
  def change
    add_index :nominee_lists, :badge_id
    add_index :nominee_lists_users, [:user_id, :nominee_list_id]
    add_index :nominee_lists_users, [:nominee_list_id, :user_id]
  end
end
