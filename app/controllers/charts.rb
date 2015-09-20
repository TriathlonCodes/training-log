get '/charts' do
  erb :charts
end

get '/charts/run' do
  @runs = Workout.select(:id, :run)
  array = [["2015", "Distance"]]
  @runs.each do |run|
    array<< [run.id, run.run]
  end
  obj = {key: array}
  return obj.to_json
end


get '/charts/bike' do
  @bike_rides = Workout.select(:id, :bike)
  array = [["2015", "Distance"]]
  @bike_rides.each do |bike|
    array<< [bike.id, bike.bike]
  end
  obj = {key: array}
  return obj.to_json
end
