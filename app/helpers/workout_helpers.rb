helpers do
  def get_last_workout
    Workout.order(year: :desc, month: :desc, day: :desc).first
  end
end
