class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :swim
      t.decimal :bike, precision: 2
      t.decimal :run, precision: 2
      t.string :description
      t.string :type
      t.integer :hours_sleep
      t.integer :duration_hours
      t.integer :duration_minutes
      t.integer :duration_seconds
      t.timestamps(null: false)
    end
  end
end
