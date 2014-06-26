class CreateNomineeLists < ActiveRecord::Migration
  def change
    create_table :nominee_lists do |t|
      t.integer :badge_id, index: true

      t.timestamps
    end
  end
end
