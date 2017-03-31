class CreateShortAnswerQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :short_answer_questions do |t|
      t.string :text
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
