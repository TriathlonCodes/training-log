get '/' do
  # @ordered_workouts = Workout.order(date: :desc)
  erb :index
end

get '/workouts/new' do
  erb :new_workout
end
