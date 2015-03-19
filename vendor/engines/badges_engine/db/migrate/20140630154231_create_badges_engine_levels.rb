class CreateBadgesEngineLevels < ActiveRecord::Migration
  def change
    create_table :badges_engine_levels do |t|
      t.integer :tier

      t.timestamps
    end
  end
end
