class CreateVotations < ActiveRecord::Migration
  def change
    create_table :votations do |t|
      t.references :badge, index: true
      t.boolean :is_open

      t.timestamps
    end
  end
end
