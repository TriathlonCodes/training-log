class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :date
      t.integer :swim
      t.float :bike, limit: 2
      t.float :run, limit: 2
      t.string :description
      t.string :intensity
      t.integer :hours_sleep
      t.integer :duration_hours
      t.integer :duration_minutes
      t.integer :duration_seconds
      t.timestamps(null: false)
    end
  end
end
