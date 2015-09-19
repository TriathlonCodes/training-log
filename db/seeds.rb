require 'csv'
 ## uncomment when you need to do comparisons
# CSV.open('db/data/old_training.csv', headers: true).each do |line|
#   unless line["swim"] == nil && line["bike"] == nil && line["run"] == nil
#     date = line["date"]
#     year = date[-4..-1]

#     month = date[/^\d{1,2}/]
#     day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
#     Workout.create(year: year.to_i, month: month.to_i, day: day.to_i, swim: line["swim"].to_i, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
#   end
# end

CSV.open('db/data/training_log_data.csv', headers: true).each do |line|
  unless line["swim"] == nil && line["bike"] == nil && line["run"] == nil
    date = line["date"]
    year = date[-4..-1]

    month = date[/^\d{1,2}/]
    day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
    Workout.create(year: year.to_i, month: month.to_i, day: day.to_i, swim: line["swim"].to_i, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
  end
end

