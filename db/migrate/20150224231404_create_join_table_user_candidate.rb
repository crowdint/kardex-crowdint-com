class CreateJoinTableUserCandidate < ActiveRecord::Migration
  def change
    create_join_table :users, :candidates
  end
end
