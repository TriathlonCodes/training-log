## read
get '/' do

  @ordered_workouts = Workout.order(:date)
  erb :index
end

get '/workouts' do
  erb :index
end
get '/workouts/new' do
  erb :new_workout
end

get '/workouts/:id' do
  erb :workout
end

#create

post '/workouts' do
  Workout.create(params)
  redirect '/workouts'
end

#edit

get '/workouts/:id/edit' do
  @workout = Workout.find(params[:id])
  erb :edit_workout
end

post '/workouts/:id' do

  Workout.find(params[:id]).update(
    date: params[:date];
    swim: params[:swim],
    bike: params[:bike],
    run: params[:run],
    description: params[:description])
  redirect '/workouts'
end

#delete

post '/workouts/:id' do
  Workout.where(id: params[:id]).destroy
  redirect '/'
end
