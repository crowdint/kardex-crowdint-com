class CreateFeedbookQuizUsers < ActiveRecord::Migration
  def change
    create_table :feedbook_quiz_users do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.text    :questions_pool
      t.text    :feedback
      t.string  :state
      t.time    :time_limit
      t.time    :time_used
      t.timestamps
    end
  end
end
