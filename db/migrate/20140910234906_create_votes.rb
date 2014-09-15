class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votation, index: true
      t.references :user, index: true
      t.integer :voted_user_id, index: true
      t.string :reason

      t.timestamps
    end
  end
end
