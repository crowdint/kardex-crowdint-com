class CreateFeedbookQuestions < ActiveRecord::Migration
  def change
    create_table :feedbook_questions do |t|
      t.string :name
      t.time :duration
      t.string :state
      t.string :type_question
      t.string :uuid
      t.string :tags
      t.integer :level_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
