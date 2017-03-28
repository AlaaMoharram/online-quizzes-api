class CreateMcqChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :mcq_choices do |t|
      t.string :text
      t.boolean :is_correct
      t.references :mcq_question, foreign_key: true

      t.timestamps
    end
  end
end
