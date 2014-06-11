class CreateJoinTablePositionUser < ActiveRecord::Migration
  def change
    create_join_table :positions, :users do |t|
      # t.index [:position_id, :user_id]
      # t.index [:user_id, :position_id]
    end
  end
end
