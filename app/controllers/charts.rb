get '/charts' do
  erb :charts
end

get '/charts/last_year/run' do

  runs = [["Date", "Distance"]]
  # the_last_365_days
  the_last_365_days.each do |workout|
    runs << [workout.date, workout.run]
  end
  obj = {workout: runs}
  return obj.to_json
end


get '/charts/last_year/bike' do
  # @bike_rides = Workout.order(date: :desc).select(:date, :bike).limit(100).reverse
  bikes = [["2015", "Distance"]]
  the_last_365_days.each do |bike|
    bikes<< [bike.date, bike.bike]
  end

  obj = {workout: bikes}
  return obj.to_json
end

get '/charts/last_year/swim' do
  # @swims = Workout.order(date: :desc).select(:date, :swim).limit(100).reverse
  swims = [["2015", "Distance"]]
  the_last_365_days.each do |swim|
    swims<< [swim.date, swim.swim]
  end
  obj = {workout: swims}
  return obj.to_json
end

get '/charts/year/:year' do
  @year = params[:year]

end