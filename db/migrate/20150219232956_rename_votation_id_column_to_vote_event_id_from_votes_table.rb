class RenameVotationIdColumnToVoteEventIdFromVotesTable < ActiveRecord::Migration
  def change
    rename_column :votes, :votation_id, :vote_event_id
  end
end
