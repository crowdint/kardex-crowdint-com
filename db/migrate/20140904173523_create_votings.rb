class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :badge, index: true
      t.boolean :is_open

      t.timestamps
    end
  end
end
