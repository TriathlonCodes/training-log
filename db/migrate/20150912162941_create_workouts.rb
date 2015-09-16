class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.float :swim
      t.float :bike
      t.float :run
      t.string :description
      t.timestamps(null: false)
    end
  end
end
