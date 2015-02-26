class CreateFeedbookQuizUsersQuestions < ActiveRecord::Migration
  def change
    create_table :feedbook_quiz_users_questions do |t|
      t.integer :question_id
      t.integer :quiz_user_id
      t.boolean :answered, default: false
      t.integer :points, default: 0
      t.timestamps
    end
  end
end
