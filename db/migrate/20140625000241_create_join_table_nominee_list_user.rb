class CreateJoinTableNomineeListUser < ActiveRecord::Migration
  def change
    create_join_table :nominee_lists, :users
  end
end
