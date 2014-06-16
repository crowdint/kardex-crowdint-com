class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :achievables_users, [:user_id, :achievable_id]
    add_index :achievables_users, [:achievable_id, :user_id]
    add_index :skills_users, [:user_id, :skill_id]
    add_index :skills_users, [:skill_id, :user_id]
    add_index :achievables, [:id, :type]
  end
end


