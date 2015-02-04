class CreateFeedbookSkills < ActiveRecord::Migration
  def change
    create_table :feedbook_skills do |t|
      t.string  :name
      t.string  :description
      t.text    :summary
      t.string  :category
      t.timestamps
    end
  end
end
