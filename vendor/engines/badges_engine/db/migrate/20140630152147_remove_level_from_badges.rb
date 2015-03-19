class RemoveLevelFromBadges < ActiveRecord::Migration
  def change
    remove_column :badges_engine_badges, :level, :integer
  end
end
