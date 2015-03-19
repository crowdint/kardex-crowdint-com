class RemoveLevelIdFromBadges < ActiveRecord::Migration
  def change
    remove_index :badges_engine_badges, :level_id
  end
end
