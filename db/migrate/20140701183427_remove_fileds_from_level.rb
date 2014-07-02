class RemoveFiledsFromLevel < ActiveRecord::Migration
  def change
    remove_column :badges_engine_levels, :name
    remove_column :badges_engine_levels, :description
    add_column :badges_engine_levels, :tier, :integer
    add_column :badges_engine_levels, :badge_alias, :string
  end
end
