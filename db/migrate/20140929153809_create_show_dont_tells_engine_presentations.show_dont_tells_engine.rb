# This migration comes from show_dont_tells_engine (originally 20140929151142)
class CreateShowDontTellsEnginePresentations < ActiveRecord::Migration
  def change
    create_table :show_dont_tells_engine_presentations do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :show_dont_tell_id

      t.timestamps
    end
  end
end
