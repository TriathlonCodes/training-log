helpers do
  def get_last_workout
    Workout.order(date: :desc, id: :desc).first
  end

  def workouts
    Workout.order(date: :desc, id: :desc)
  end

  def current_workout
    Workout.where(id: params[:id]).first
  end

  def self.has_workout_data?
    if self["run"] != 0.0 || self["bike"] != 0.0 || self["swim"] != 0 || self["description"] != ""
      true
    else
      false
    end
  end
end
