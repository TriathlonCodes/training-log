get '/charts' do
  erb :charts
end

get '/charts/show' do
  if params["format"] != "cumulative-format" && params["year"] != "select-year"
    format = params["format"]
    year = params["year"]
    return "/charts/#{year}/#{format}"
  end
end

get '/charts/:year/cumulative/:sport' do
  year = params[:year]
  sport = params[:sport]
  workouts = [[year, "Distance"]]
  acumulations = Workout.cumulative(year)
  p acumulations[sport]
  acumulations[sport].each do |date, workout|
    workouts << [date, workout]
  end
  obj = {workout: workouts}
  return obj.to_json
end


get '/charts/:year/individual/:sport' do
  year = params[:year]
  sport = params[:sport]
  workouts = [[year, "Distance"]]
  workouts_from_year(year).each do |workout|
    workouts << [workout.date, workout[sport]]
  end
  obj = {workout: workouts}
  return obj.to_json

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

get '/charts/years/:year/run' do
  @year = params[:year]
  runs = [[@year, "Distance"]]
  acumulations = Workout.cumulative(@year)
  acumulations[1].each do |date, run|
    runs<< [date, run]
  end
  obj = {workout: runs}
  return obj.to_json
end

get '/charts/years/:year/swim' do
  @year = params[:year]
  swims = [[@year, "Distance"]]
  acumulations = Workout.cumulative(@year)
  acumulations[1].each do |date, swim|
    swims<< [date, swim]
  end
  obj = {workout: swims}
  return obj.to_json
end

get '/charts/years/:year/bike' do
  @year = params[:year]
  bikes = [[@year, "Distance"]]
  acumulations = Workout.cumulative(@year)
  acumulations[1].each do |date, bike|
    bikes<< [date, bike]
  end
  obj = {workout: bikes}
  return obj.to_json
  # "THIS IS A THING"
end

