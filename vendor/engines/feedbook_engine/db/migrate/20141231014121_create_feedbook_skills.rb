class CreateFeedbookSkills < ActiveRecord::Migration
  def change
    create_table :feedbook_skills do |t|
      t.string  :name
      t.string  :category
      t.text    :description
      t.timestamps
    end
  end
end
