class DropJoinTableBadgesUsers < ActiveRecord::Migration
  def change
    drop_join_table :badges, :users
  end
end
