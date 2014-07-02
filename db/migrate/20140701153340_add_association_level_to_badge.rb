class AddAssociationLevelToBadge < ActiveRecord::Migration
  def change
    create_table :badges_engine_levels do |t|
      t.string :tier
      t.text :description
      t.belongs_to :badges

      t.timestamps
    end

    remove_reference :badges_engine_badges, :level
  end
end
