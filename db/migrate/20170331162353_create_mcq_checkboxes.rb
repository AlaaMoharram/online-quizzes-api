class CreateMcqCheckboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :mcq_checkboxes do |t|
      t.string :text
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
