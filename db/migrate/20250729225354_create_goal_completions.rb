class CreateGoalCompletions < ActiveRecord::Migration[8.0]
  def change
    create_table :goal_completions do |t|
      t.references :goal, null: false, foreign_key: true
      t.date :date
      t.boolean :achieved
      t.integer :actual_minutes

      t.timestamps
    end
  end
end
