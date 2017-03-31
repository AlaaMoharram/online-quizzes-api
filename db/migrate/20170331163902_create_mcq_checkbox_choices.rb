class CreateMcqCheckboxChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :mcq_checkbox_choices do |t|
      t.string :text
      t.boolean :is_correct, :default => false
      t.references :mcq_checkbox, foreign_key: true

      t.timestamps
    end
  end
end
