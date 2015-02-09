class CreateFeedbookQuizzes < ActiveRecord::Migration
  def change
    create_table :feedbook_quizzes do |t|
      t.string  :name
      t.string  :description
      t.text    :summary
      t.integer :duration
      t.integer :level_id
      t.string  :state
      t.string  :uuid
      t.string  :distribution_rules
      t.string  :distribution_skills
      t.timestamps
    end
  end
end
