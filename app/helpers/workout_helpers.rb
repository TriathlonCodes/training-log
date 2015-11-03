helpers do

  def athlete
    Athlete.where(:id, params[:athlete]).first
  end

  def get_last_workout
    workouts = Workout.where(athlete_id: session[:athlete_id]).order(date: :desc, id: :desc).all
    workouts.each do |workout|
      if workout.has_workout_data?
        p "this should only be one"
        return workout
      end
    end
  end


  def workouts
    Workout.where(athlete_id: session[:athlete_id]).order(date: :desc, id: :desc).select{ |workout|
     workout.has_workout_data?
    }

  end

  def current_workout
    Workout.where(id: params[:id]).first
  end

  # def the_last_365_days
  #   Workout.where(athlete_id: session[:athlete], "date < ?", Date.today)[-365..-1]
  # end

  def all_years
    first_year = workouts[-1].date.year
    return (first_year..Date.today.year).to_a
  end

  def parse_mmddyyyy(date) #in format mm/dd/yyyy
    year = date[-4..-1]
    p year
    month = date[/^\d{1,2}/]
    day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
    Date.parse("#{day}/#{month}/#{year}")
  end

  def upload_excel_data(file)
    if /xls/ =~ file
      xlsx = Roo::Spreadsheet.open(file)
      all_workouts = xlsx.sheet(0).parse(headers: true)
      all_workouts.each do |workout|
        Workout.create(athlete_id: session[:athlete_id], date: workout['date'], swim: workout['swim'], bike: workout['bike'], run: workout['run'], description: workout['description'])
      end
    else
      return false
    end
  end


end
