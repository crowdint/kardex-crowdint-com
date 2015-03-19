class AddValueIdToBadges < ActiveRecord::Migration
  def change
    add_reference :badges_engine_badges, :value, index: true
  end
end
