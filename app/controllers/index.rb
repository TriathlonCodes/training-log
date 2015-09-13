get '/' do
  @ordered_workouts = Workout.order(:date)
  erb :index
end
