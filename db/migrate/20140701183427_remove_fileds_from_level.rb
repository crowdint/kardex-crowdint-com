class RemoveFiledsFromLevel < ActiveRecord::Migration
  def change
    add_column :badges_engine_levels, :tier, :integer
    add_column :badges_engine_levels, :badge_alias, :string
  end
end
