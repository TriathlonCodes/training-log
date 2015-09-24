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
