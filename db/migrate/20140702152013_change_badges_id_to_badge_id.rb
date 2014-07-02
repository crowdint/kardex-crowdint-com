class ChangeBadgesIdToBadgeId < ActiveRecord::Migration
  def change
    change_table :badges_engine_levels do |t|
      t.rename :badges_id, :badge_id
    end
  end
end
