class RenameBadgeProposalsToNomineeUsers < ActiveRecord::Migration
  def change
    rename_table :badge_proposals, :nominee_users
  end
end
