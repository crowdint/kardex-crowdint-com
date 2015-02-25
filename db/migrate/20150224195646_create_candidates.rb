class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.timestamps
    end

    add_reference :candidates, :vote_event, index: true
  end
end
