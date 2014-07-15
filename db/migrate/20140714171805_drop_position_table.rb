class DropPositionTable < ActiveRecord::Migration
  def up
    drop_table :positions
  end

  def down
    create_table :positions do |t|
      t.string :name
      t.string :description
      t.string :image_url
    end
  end
end
