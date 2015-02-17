class CreateBadgesEngineValues < ActiveRecord::Migration
  def change
    create_table :badges_engine_values do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
