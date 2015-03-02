class AddMissingIndexes2 < ActiveRecord::Migration
  def change
    add_index :roles_users, [:user_id, :role_id]
    add_index :roles_users, [:role_id, :user_id]
    add_index :votes, :voted_user_id
    add_index :presentations_engine_presentations, :user_id
    add_index :badge_users, :user_id
    add_index :badge_users, :badge_id
  end
end
