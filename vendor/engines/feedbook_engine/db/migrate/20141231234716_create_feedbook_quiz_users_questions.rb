class CreateFeedbookQuizUsersQuestions < ActiveRecord::Migration
  def change
    create_table :feedbook_quiz_users_questions do |t|
      t.integer :question_id
      t.integer :quiz_user_id
      t.timestamps
    end
  end
end
