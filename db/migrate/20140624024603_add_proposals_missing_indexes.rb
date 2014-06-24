class AddProposalsMissingIndexes < ActiveRecord::Migration
  def change
    add_index :badge_proposals, :badge_id
  end
end
