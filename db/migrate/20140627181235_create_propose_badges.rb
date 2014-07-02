class CreateProposeBadges < ActiveRecord::Migration
  def change
    create_table :propose_badges do |t|
      t.string :name
      t.integer :value_id
      t.text :description

      t.timestamps
    end
    add_index :propose_badges, :value_id
  end
end
