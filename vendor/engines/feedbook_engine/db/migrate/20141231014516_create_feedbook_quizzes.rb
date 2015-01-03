class CreateFeedbookQuizzes < ActiveRecord::Migration
  def change
    create_table :feedbook_quizzes do |t|
      t.string  :name
      t.string  :description
      t.time    :duration
      t.string  :state
      t.text    :distribution_rule
      t.text    :distribution_skills
      t.timestamps
    end
  end
end
