
get '/workouts' do
  @most_recent_workouts = workouts[0..14]
  erb :index
end

get '/workouts/new' do
  p request
  if request.xhr?
    erb :'workouts/new_workout', layout: false
  else
    erb :'workouts/new_workout'
  end
end

get '/workouts/show' do
  erb :'workouts/show'
end

get '/workouts/:id' do
  erb :'/workouts/workout'
end

#create

post '/workouts' do
  # if @params.has_workout_data?
  workout = Workout.create(@params)
  if workout == Workout.last
    puts "Success"
  else
    puts "fail"
  end
  # else
    # puts "This is an empty workout"
    # workout = nil
  # end
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
#### WHY ARE ONLY SOME OF THESE UPDATING! ###
post '/workouts/:id' do
  Workout.find(params[:id]).update(
    date: params[:date],
    swim: params[:swim],
    bike: params[:bike],
    run: params[:run],
    description: params[:description],
    intensity: params[:intensity],
    hours_sleep: parms[:hours_sleep].to_int,
    duration_hours: params[:duration_hours].to_int,
    duration_seconds: params[:duration_seconds].to_int,
    duration_minutes: params[:duration_minutes].to_int)
  redirect '/workouts'
end

#delete

get '/workouts/:id/delete' do
  Workout.find(params[:id]).destroy
  redirect '/'
end
