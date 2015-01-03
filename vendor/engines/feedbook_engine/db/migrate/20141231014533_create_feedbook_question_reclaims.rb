class CreateFeedbookQuestionReclaims < ActiveRecord::Migration
  def change
    create_table :feedbook_question_reclaims do |t|
      t.integer :question_id
      t.string  :description
      t.string  :category
      t.string  :state
      t.integer :user_id
      t.timestamps
    end
  end
end
