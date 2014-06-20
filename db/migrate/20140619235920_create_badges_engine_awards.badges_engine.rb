# This migration comes from badges_engine (originally 20140619183321)
class CreateBadgesEngineAwards < ActiveRecord::Migration
  def change
    create_table :badges_engine_awards do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
