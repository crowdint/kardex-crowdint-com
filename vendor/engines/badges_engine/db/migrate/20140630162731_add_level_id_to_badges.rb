class AddLevelIdToBadges < ActiveRecord::Migration
  def change
    add_reference :badges_engine_badges, :level, index: true
  end
end
