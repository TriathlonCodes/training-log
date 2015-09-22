require 'csv'
require 'date'

module ConvertDate

  def parse_mmddyyyy(date) #in format mm/dd/yyyy
    year = date[-4..-1]
    p year
    month = date[/^\d{1,2}/]
    day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
    Date.parse("#{day}/#{month}/#{year}")
  end
end


include ConvertDate
 ## uncomment when you need to do comparisons
CSV.open('db/data/old_training.csv', headers: true).each do |line|
  # unless line["swim"] == nil && line["bike"] == nil && line["run"] == nil
    date = line["date"]
    p date
    parsed_date = ConvertDate::parse_mmddyyyy(date)
    p parsed_date
    # year = date[-4..-1]

    # month = date[/^\d{1,2}/]
    # day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
    Workout.create(date: parsed_date, swim: line["swim"].to_i, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
  # end
end

CSV.open('db/data/training_log_data.csv', headers: true).each do |line|
  # unless line["swim"] == nil && line["bike"] == nil && line["run"] == nil
    date = (line["date"])
    parsed_date = ConvertDate::parse_mmddyyyy(date)
    Workout.create(date: parsed_date, swim: line["swim"].to_i, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
  # end
end

