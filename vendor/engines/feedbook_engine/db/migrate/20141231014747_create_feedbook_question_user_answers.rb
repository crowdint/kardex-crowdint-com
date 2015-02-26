class CreateFeedbookQuestionUserAnswers < ActiveRecord::Migration
  def change
    create_table :feedbook_question_user_answers do |t|
      t.integer :users_question_id
      t.integer :answer_id
      t.text    :answer_text
      t.string  :duration
      t.string  :points_cache
      t.timestamps
    end
  end
end
