class RenameVotationTableToVoteEventTable < ActiveRecord::Migration
  def change
    rename_table :votations, :vote_events
  end
end
