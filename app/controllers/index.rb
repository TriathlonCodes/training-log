## read
get '/' do
  # @ordered_workouts = Workout.order(date: :desc)
  redirect '/workouts'
end

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
  workout = Workout.new(@params)
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

put '/workouts/:id' do
  ##maybe there is a better way? getting errors with :splat
  # params[:date] = params[:date][5..6]+ "/"+params[:date][-2..-1]+"/"+params[:date][0..3]
  # params[:date] = params["month"]+"/"+params["day"]+"/"+params["year"]
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
    duration_minutes: params[:duration_minutes]
    )
  redirect '/workouts'
end

#delete

get '/workouts/:id/delete' do
  Workout.find(params[:id]).destroy
  redirect '/'
end

