# This migration comes from badges_engine (originally 20140624174414)
class AddValueIdToBadges < ActiveRecord::Migration
  def change
    add_reference :badges_engine_badges, :value, index: true
  end
end
