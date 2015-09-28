require 'pry'

# before '/*' do
#   params[:athlete_id] = session[:athlete]
# end

get '/' do
  @workouts = workouts
  erb :index
end

get '/workouts/new' do
  if request.xhr?
    erb :'workouts/new_workout', layout: false
  else
    erb :'workouts/new_workout'
  end
end

get '/workouts/show' do
  @workouts = workouts
  erb :'workouts/show'
end

# get '/workouts/:id' do
#   erb :'/workouts/workout'
# end

#create

post '/workouts' do
  # if @params.has_workout_data?
  workout = Workout.create(params)
  p workout.errors.messages
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
    redirect '/'
  end
end

#edit

get '/workouts/:id/edit' do
  @workout = Workout.find(params[:id])
  if @workout.athlete == session[:athlete]
    p "hit"
    erb :'workouts/edit_workout'
  else
    p "NOT"
    redirect '/workouts'
  end
end

#delete

get '/workouts/:id/delete' do
  Workout.find(params[:id]).destroy
  redirect '/'
end
