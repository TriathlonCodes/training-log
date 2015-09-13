class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :date
      t.float :swim
      t.float :bike
      t.float :run
      t.string :description
      t.timestamps(null: false)
    end
  end
end
