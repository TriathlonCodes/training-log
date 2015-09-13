require 'csv'

CSV.open('db/data/old_training.csv', headers: true).each do |line|
  unless line["swim"] == nil && line["bike"] == nil && line["run"] == nil
    Workout.create(date: line["date"], swim: line["swim"].to_f, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
  end
end

CSV.open('db/data/training_log_data.csv', headers: true).each do |line|
  unless line["swim"] == nil && line["bike"] == nil && line["run"] == nil
    Workout.create(date: line["date"], swim: line["swim"].to_f, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
  end
end

