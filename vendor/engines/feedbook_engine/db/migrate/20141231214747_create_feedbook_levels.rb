class CreateFeedbookLevels < ActiveRecord::Migration
  def change
    create_table :feedbook_levels do |t|
      t.string :name
      t.integer :value
      t.timestamps
    end
  end
end
