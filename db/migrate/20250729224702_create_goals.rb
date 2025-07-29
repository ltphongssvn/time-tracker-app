class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, foreign_key: true
      t.string :goal_type
      t.integer :target_minutes
      t.integer :hour
      t.string :days_of_week
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
