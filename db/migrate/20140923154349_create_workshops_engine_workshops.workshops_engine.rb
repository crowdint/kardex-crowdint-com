# This migration comes from workshops_engine (originally 20140922173424)
class CreateWorkshopsEngineWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops_engine_workshops do |t|
      t.string :title
      t.text :description
      t.datetime :date_and_time
      t.integer :user_id

      t.timestamps
    end
  end
end
