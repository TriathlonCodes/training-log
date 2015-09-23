get '/search' do
  erb :search
end

post '/search' do
  @workouts_selected = Workout.search_by(params)
  erb :'search'
end
