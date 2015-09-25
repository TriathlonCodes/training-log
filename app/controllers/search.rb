get '/search' do
  erb :search
end

post '/search' do
  @workouts = Workout.search_by(params)
  erb :'search'
end
