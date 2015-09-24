helpers do
  def get_last_workout
    workouts = Workout.order(date: :desc, id: :desc).all
    workouts.each do |workout|
      return workout if workout.has_workout_data?
    end
  end


  def workouts
    Workout.order(date: :desc, id: :desc).select{ |workout|
      workout.has_workout_data?
    }

  end

  def current_workout
    Workout.where(id: params[:id]).first
  end

  def the_last_365_days
    Workout.where("date < ?", Date.today)[-365..-1]
  end

  def workouts_from_year(year)
    Workout.where("date >= ?", "#{year}-01-01").where("date <= ?", "#{year}-12-31").order(date: :asc, id: :desc)
  end

  def all_years
    first_year = workouts[-1].date.year
    return (first_year..Date.today.year).to_a
  end

end
