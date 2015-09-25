require 'csv'
require 'date'
# require_relative 'convert_date'
# module ConvertDate

#   def parse_mmddyyyy(date) #in format mm/dd/yyyy
#     year = date[-4..-1]
#     p year
#     month = date[/^\d{1,2}/]
#     day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
#     Date.parse("#{day}/#{month}/#{year}")
#   end

#   def parse_to_google(date)
#     p date
#   end
# end


include ConvertDate

# CSV.open('db/data/old_training.csv', headers: true).each do |line|

#     date = line["date"]
#     parsed_date = ConvertDate::parse_mmddyyyy(date)
#     Workout.create(date: parsed_date, swim: line["swim"].to_i, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])

# end

CSV.open('db/data/training_log_data.csv', headers: true).each do |line|

  date = (line["date"])
  parsed_date = ConvertDate::parse_mmddyyyy(date)
  Workout.create(date: parsed_date, swim: line["swim"].to_i, bike: line["bike"].to_f, run: line["run"].to_f, description: line["description"])
end

