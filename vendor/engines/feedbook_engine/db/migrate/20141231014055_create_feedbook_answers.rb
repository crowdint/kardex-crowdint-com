class CreateFeedbookAnswers < ActiveRecord::Migration
  def change
    create_table :feedbook_answers do |t|
      t.integer :question_id
      t.string  :text
      t.string  :state
      t.boolean :is_valid
      t.timestamps
    end
  end
end
