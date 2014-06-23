class CreateBadgeProposals < ActiveRecord::Migration
  def change
    create_table :badge_proposals do |t|
      t.integer :badge_id, index: true
      t.references :user, index: true
      t.string :why

      t.timestamps
    end
  end
end
