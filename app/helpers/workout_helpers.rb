helpers do
  def get_last_workout
    Workout.order(date: :desc, id: :desc).first
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

end
