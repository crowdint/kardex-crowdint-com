class RemoveAchievablesAndAchievablesUserTable < ActiveRecord::Migration
  def up
    drop_table :achievables
    drop_table :achievables_users
  end

  def down
    create_table :achievables do |t|
      t.string :name
      t.text :description
      t.string :type

      t.timestamps
    end

    create_table :achievables_users do |t|
      t.integer :achievable_id
      t.integer :user_id
    end
  end
end
