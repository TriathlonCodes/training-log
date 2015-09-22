get '/charts' do
  erb :charts
end

get '/charts/run' do
  @runs = Workout.select(:date, :run)
  array = [["Date", "Distance"]]
  @runs.each do |run|
    array<< [run.date, run.run]
  end
  obj = {workout: array}
  return obj.to_json
end


# get '/charts/bike' do
#   @bike_rides = Workout.select(:id, :bike)
#   array = [["2015", "Distance"]]
#   @bike_rides.each do |bike|
#     array<< [bike.id, bike.bike]
#   end
#   obj = {workout: array}
#   return obj.to_json
# end

# get '/charts/swim' do
#   @swims = Workout.select(:id, :swim)
#   array = [["2015", "Distance"]]
#   @swims.each do |swim|
#     array<< [swim.id, swim.swim]
#   end
#   obj = {workout: array}
#   return obj.to_json
# end
