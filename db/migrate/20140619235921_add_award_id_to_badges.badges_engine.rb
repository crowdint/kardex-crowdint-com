# This migration comes from badges_engine (originally 20140619215254)
class AddAwardIdToBadges < ActiveRecord::Migration
  def change
    add_reference :badges_engine_badges, :award, index: true
    remove_column :badges_engine_badges, :award, :string
  end
end
