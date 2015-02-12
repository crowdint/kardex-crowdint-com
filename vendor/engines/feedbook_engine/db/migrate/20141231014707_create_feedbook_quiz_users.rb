class CreateFeedbookQuizUsers < ActiveRecord::Migration
  def change
    create_table :feedbook_quiz_users do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.text    :feedback
      t.string  :state
      t.string  :uuid
      t.integer :attempt
      t.integer :time_limit
      t.integer :time_used
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end
  end
end
