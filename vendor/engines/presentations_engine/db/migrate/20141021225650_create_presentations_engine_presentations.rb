class CreatePresentationsEnginePresentations < ActiveRecord::Migration
  def change
    create_table :presentations_engine_presentations do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
