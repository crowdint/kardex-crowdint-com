class CreateFeedbookQuestions < ActiveRecord::Migration
  def change
    create_table :feedbook_questions do |t|
      t.string :name
      t.string :description
      t.string :type_question
      t.string :state
      t.string :tags
      t.integer :duration
      t.integer :level_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
