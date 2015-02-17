class AddAssociationLevelToBadge < ActiveRecord::Migration
  def change
    remove_reference :badges_engine_badges, :level_id
    add_reference :badges_engine_levels, :badge, index: true
  end
end
