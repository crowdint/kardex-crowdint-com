class DeleteJoinTablePositionUser < ActiveRecord::Migration
  def change
    drop_join_table :positions, :users
  end
end
