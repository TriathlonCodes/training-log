
get '/workouts' do
  redirect '/'
end

get '/' do
  @workouts = workouts[0..15]
  erb :index
end

get '/workouts/new' do
  @athlete_id = session[:athlete_id]
  if request.xhr?
    erb :'workouts/new_workout', layout: false
  else
    erb :'workouts/new_workout'
  end
end

get '/workouts/show-all' do
  erb :'workouts/show_all'
end

# get '/workouts/:id' do
#   erb :'/workouts/workout'
# end

#create

post '/workouts' do
  workout = Workout.create(@params)

  if request.xhr?
      workout.to_json
  else
    redirect '/workouts'
  end
end

#edit

get '/workouts/:id/edit' do
  @workout = Workout.find(params[:id])
  erb :'workouts/edit_workout'
end

put '/workouts/:id' do
  ##maybe there is a better way? getting errors with :splat
  Workout.find(params[:id]).update(
    date: params[:date],
    swim: params[:swim],
    bike: params[:bike],
    run: params[:run],
    description: params[:description],
    intensity: params[:intensity],
    hours_sleep: params[:hours_sleep],
    duration_hours: params[:duration_hours],
    duration_seconds: params[:duration_seconds],
    duration_minutes: params[:duration_minutes],
    )
  redirect '/workouts'
end

#delete

get '/workouts/:id/delete' do
  Workout.find(params[:id]).destroy
  redirect '/'
end

get '/workouts/upload' do
  erb :'upload'
end

post '/workouts/upload' do
  if upload_excel_data(params[:file])
    redirect '/'
  else
    @error = "Error: your file did not upload properly. Please make sure you are following the instructions"
    erb :'upload'
  end
end
