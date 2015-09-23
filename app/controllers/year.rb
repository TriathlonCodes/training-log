get '/workouts/year/:year' do
  @year = params[:year]
  erb :'workouts/year'
end
