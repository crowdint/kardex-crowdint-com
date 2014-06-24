# This migration comes from badges_engine (originally 20140624155327)
class CreateBadgesEngineValues < ActiveRecord::Migration
  def change
    create_table :badges_engine_values do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
