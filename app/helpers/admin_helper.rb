require 'Date'

helpers do
  def athlete_ages_data
    age_freq = {}
    this_year = Date.today.year
    Athlete.all.each do |athlete|
      age = this_year - athlete.birthyear
      case
      when age < 18
        age_freq["under 18"] += 1

      when age < 25 && age >= 18
        age_freq["18-24"] += 1

      when age < 35 && age >= 25
        age_freq["25-34"] += 1

      when age < 50 && age >= 35
        age_freq["35-49"] += 1

      when age < 70 && age >= 51
        age_freq["51-59"] += 1

      when age < 70 && age >= 61
        age_freq["61-69"] += 1

      when age >= 70
        age_freq["over 70"] += 1
      end
    end

  end
end
