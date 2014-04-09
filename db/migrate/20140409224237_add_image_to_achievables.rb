class AddImageToAchievables < ActiveRecord::Migration
  def change
    add_column :achievables, :image, :string
  end
end
