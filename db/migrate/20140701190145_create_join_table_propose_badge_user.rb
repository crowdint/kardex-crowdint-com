class CreateJoinTableProposeBadgeUser < ActiveRecord::Migration
  def change
    create_join_table :propose_badges, :users do |t|
      t.index :user_id
      t.index :propose_badge_id
    end
  end
end
