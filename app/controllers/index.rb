## read
get '/' do

  @ordered_workouts = Workout.order(:date)
  erb :index
end

get '/workouts' do
  erb :index
end
get '/workouts/new' do
  "Hello World"
  erb :new_workout
end

get '/workouts/:id' do
  #probably not something I want
end

#create

post '/workouts' do
  Workout.create(params)
  redirect '/workouts'
end

#edit

get '/workouts/:id/edit' do

end

post '/workouts/:id' do

end

#delete

post '/workouts/:id' do
  Workout.where(id: params[:id]).destroy
  redirect '/'
end
