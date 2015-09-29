get '/search' do
  erb :search
end

post '/search' do
  athlete_id = session[:athlete_id]
  @workouts = Workout.search_by(params, athlete_id)
  erb :'search'
end
