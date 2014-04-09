class CreateAchievablesUsers < ActiveRecord::Migration
  def change
    create_table :achievables_users do |t|
      t.integer :achievable_id
      t.integer :user_id
    end
  end
end
