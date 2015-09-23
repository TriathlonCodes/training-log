get '/search' do
  erb :search
end

post '/search' do
  @workouts_selected = Workout.search_by(params)
  erb :'workouts/workout'
end
