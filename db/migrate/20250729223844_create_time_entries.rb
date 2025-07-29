class CreateTimeEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :time_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.date :date
      t.integer :hour
      t.integer :duration_minutes
      t.text :notes

      t.timestamps
    end

    add_index :time_entries, [:user_id, :date, :hour]
  end
end
