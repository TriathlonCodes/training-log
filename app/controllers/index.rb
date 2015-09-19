## read
get '/' do
  # @ordered_workouts = Workout.order(date: :desc)
  redirect '/workouts'
end

get '/workouts' do
  @ordered_workouts = Workout.order(year: :desc, month: :desc, day: :desc).limit(16)
  # p @ordered_workouts ##not dry
  erb :index
end
get '/workouts/new' do
  p request
  if request.xhr?
    erb :new_workout, layout: false
  else
    erb :new_workout
  end
end

get '/workouts/show' do
  erb :show
end

get '/workouts/:id' do
  erb :workout
end

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
  erb :edit_workout
end

post '/workouts/:id' do
  ##maybe there is a better way? getting errors with :splat
  # params[:date] = params[:date][5..6]+ "/"+params[:date][-2..-1]+"/"+params[:date][0..3]
  # params[:date] = params["month"]+"/"+params["day"]+"/"+params["year"]
  Workout.find(params[:id]).update(
    year: params[:year],
    month: params[:month],
    day: params[:day],
    swim: params[:swim],
    bike: params[:bike],
    run: params[:run],
    description: params[:description])
  redirect '/workouts'
end

#delete

get '/workouts/:id/delete' do
  Workout.find(params[:id]).destroy
  redirect '/'
end

